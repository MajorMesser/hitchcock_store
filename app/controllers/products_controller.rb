class ProductsController < ApplicationController
  def index
    @products = Product.order('name').page(params[:page]).per(3)
    @categories = Category.all
  end

  def show
    @product = Product.where(:category_id => params[:id])
  end

  def search
  end
end
