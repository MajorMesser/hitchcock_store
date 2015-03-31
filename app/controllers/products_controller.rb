class ProductsController < ApplicationController
  def index
    @products = Product.order('name').page(params[:page]).per(3)
    @categories = Category.all
  end

  def show
    @products = Product.where(:id => params[:id])
  end

  def search
    @products = Product.where("category_id = #{params[:category_id]}")
  end
end
