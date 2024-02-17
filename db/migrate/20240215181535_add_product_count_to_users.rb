class AddProductCountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :products_count, :integer
    User.find_each do |user|
      User.reset_counters(user.id, :products)
    end
  end
end
