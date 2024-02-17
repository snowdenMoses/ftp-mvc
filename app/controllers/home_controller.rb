class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @products = Product.includes(:images_attachments).order(created_at: :desc).paginate(page: params[:page], per_page:10)
  end

end
