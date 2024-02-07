class Vendors::FavouritesController < ApplicationController
  layout "vendor"

  def index
    favourites = Favourite.includes(:product, user: :personal_detail).where(user_id: current_user.id, status: 'active')
    @favourite_products = favourites.map do |favourite|
      favourite.product
    end
  end
end
