class Customers::ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def show
    @product_details = {
      product: @product,
      user: @product.user
    }
  end

  def index
    product_param = params[:product]
    if product_param.present?
      @products = Product.includes(:categories).where("name ILIKE ?", "%#{product_param}%")
    else
      redirect_to :home_root
    end
  end

  private

  def set_product
    @product = Product.includes(:comments, user: [:personal_detail]).find_by_id(params[:id])
    raise Record::NoRecordFound, 'No record found' if @product.nil?
  end
end
