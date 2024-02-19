class AdminController < ApplicationController
  layout 'admin'
  def index
    product_param = params[:product]
    if product_param.present?
      @products = Product.includes(:categories).where("name ILIKE ?", "%#{product_param}%").paginate(page: params[:page], per_page:10)
    else
      @products = Product.includes(:images_attachments).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end

  end

  def dashboard

  end
end
