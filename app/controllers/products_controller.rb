class ProductsController < ApplicationController
  def index
    @products = Product.order('name').page(params[:page]).per(3)
    @categories = Category.all
    @cart_items = session[:cart].map do |key|
      Product.find(key)
    end
    session[:line_items] = @cart_items
    @sum = 0
    @cart_items.each do |item|
      @sum += item.price
    end
  end

  def show
    @products = Product.where(:id => params[:id])
  end

  def search
    if params[:category_id].to_i == 0
      @products = Product.where("name LIKE '%#{params[:query]}%'").page(params[:page]).per(3)
    else
      @products = Product.where("name LIKE '%#{params[:query]}%' and category_id = #{params[:category_id]}").page(params[:page]).per(3)
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
    @cart_items = session[:cart].map do |key|
      Product.find(key)
    end
    @sum = 0
    @cart_items.each do |item|
      @sum += item.price
    end
    @provinces = Province.all
  end

  def create
    @cart_items = session[:cart].map do |key|
      Product.find(key)
    end



    reset_session
    redirect_to root_path
  end
end
