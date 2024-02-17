class Customers::StatesController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    state = State.includes(:products).find(params[:id])
    @state_products = state.products
  end

  def index
    state = State.includes(:products).where("products_count > ?", 0 )
    @state_products = state.products
  end
end
