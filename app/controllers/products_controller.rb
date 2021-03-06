class ProductsController < ApplicationController
  def index
    @products = Product.order('name').page(params[:page]).per(3)
    @categories = Category.all
    @cart_items = retrieve_cart_items
    session[:line_items] = @cart_items
    @sum = 0
    @cart_items.each do |item|
      @sum += item.price
    end
  end

  def show
    @product = Product.where(id: params[:id])
  end

  def search
    if params[:category_id].to_i == 0
      @products = Product.where("name LIKE '%#{params[:query]}%'").page(params[:page]).per(3)
    else
      @products = category_search
    end
    @categories = Category.all
  end

  def sale_filter
    @products = Product.where("CAST(price AS STRING) LIKE '%88'").page(params[:page]).per(3)
    @categories = Category.all
  end

  def new_filter
    @products = Product.where('created_at > :date', date: 2.weeks.ago).page(params[:page]).per(3)
    @categories =  Category.all
  end

  def add_to_cart
    session[:cart] << params[:id]
    redirect_to root_path
  end

  def checkout
    @cart_items = retrieve_cart_items
    @sum = 0
    @cart_items.each do |item|
      @sum += item.price
    end
    @provinces = Province.all
  end

  def create
    @cart_items = retrieve_cart_items

    @customer = Customer.new
    @customer.province_id = params[:province]
    @customer.first_name = params[:first_name]
    @customer.last_name = params[:last_name]
    @customer.address = params[:address]
    @customer.city = params[:city]
    @customer.postal_code = params[:postal_code]
    @customer.email = params[:email]

    if @customer.save
      @order = @customer.orders.build
      @order.status = 'pending'
      @order.gst_rate = @customer.province.gst
      @order.pst_rate = @customer.province.pst
      @order.hst_rate = @customer.province.hst
      if @order.save
        @cart_items.each do |item|
          @line_item = @order.line_items.build
          @line_item.quantity = 1
          @line_item.product = item
          @line_item.price = item.price
          @line_item.save!
        end
      end
    end
    reset_session
    redirect_to root_path
    flash[:alert] = 'Order successfully placed'
  end

  private def category_search
    Product.where("name LIKE '%#{params[:query]}%' and category_id =
  #{params[:category_id]}").page(params[:page]).per(3)
  end

  private def retrieve_cart_items
    session[:cart].map do |key|
      Product.find(key)
    end
  end
end
