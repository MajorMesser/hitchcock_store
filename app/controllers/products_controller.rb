class ProductsController < ApplicationController
  def index
    @products = Product.order('name').page(params[:page]).per(3)
    @categories = Category.all
  end

  def show
    @products = Product.where(:id => params[:id])
  end

  def search
    @products = Product.where("name LIKE '%#{params[:query]}%'").page(params[:page]).per(3)
    @categories = Category.all
  end
end
