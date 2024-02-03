class FavouritesController < ApplicationController

  def index
    favourites = Favourite.includes(:product, user: :personal_detail).where(user_id: current_user.id, status: 'active')
    @favourite_products = favourites.map do |favourite|
      favourite.product
    end

  end

  def create
    @product_id = params[:product]
    @product = Product.find_by(id: @product_id)
    @favourite = Favourite.new(user_id: current_user.id, product_id: @product_id)

    respond_to do |format|
      if @favourite.save
        @users_favourite_counter = Favourite.where(user_id: current_user.id).count

        format.turbo_stream
        format.html { render "home/index" }
      else
        format.html { render "home/index" }
      end
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @favourite = Favourite.find_by(user_id: current_user.id, product_id: params[:id])
    @favourite.destroy

    @users_favourite_counter = Favourite.where(user_id: current_user.id).count

    respond_to do |format|
      if @favourite.destroyed?
        favourites = Favourite.includes(:product, user: :personal_detail).where(user_id: current_user.id, status: 'active')
        @favourite_products = favourites.map do |favourite|
          favourite.product
        end
        format.turbo_stream
      end
    end
  end

  private

  def favourite_exist?
    @existing_favourite = Favourite.where(user_id: current_user.id, product_id: @product_id)
    @existing_favourite.any?
  end
end
