class AddFavouritesCountToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :favourites_count, :integer
    Product.find_each { |product| Product.reset_counters(product.id, :favourites)}
  end
end
