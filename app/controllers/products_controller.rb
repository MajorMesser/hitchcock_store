class ProductsController < ApplicationController
  def index
    @products = Product.order('name').page(params[:page]).per(3)
    @categories = Category.all
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
end
