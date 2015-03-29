class CategoryController < ApplicationController

  def index
    @category = Category.all
  end

  def list
    @category = Category.all
  end

end
