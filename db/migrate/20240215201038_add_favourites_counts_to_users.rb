class AddFavouritesCountsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :favourites_count, :integer
    User.find_each { |user| User.reset_counters(user.id, :favourites)}
  end
end
