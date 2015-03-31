class CategoryController < ApplicationController

  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.find(params[:id])
  end

end
