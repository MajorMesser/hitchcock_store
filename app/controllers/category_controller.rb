class CategoryController < ApplicationController

  def index
    @category = Category.all
  end

  def show
    @categories = Category.all
    @products = Product.where(:category_id => params[:id]).page(params[:page]).per(3)
  end

end
