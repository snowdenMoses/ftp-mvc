class Customers::StatesController < ApplicationController
  def show
    state = State.includes(:products).find(params[:id])
    @state_products = state.products
  end
end
