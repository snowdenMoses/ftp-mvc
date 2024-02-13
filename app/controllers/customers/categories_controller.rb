class Customers::CategoriesController < ApplicationController
  def show
    category = Category.includes(:products).find(params[:id])
    @category_products = category.products
  end

  def index
    @categories = Category.includes(:products).all
    # @category_products = category.products
  end
end
