class CreateFavourites < ActiveRecord::Migration[7.1]
  def change
    create_table :favourites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :favourites, [:user_id, :product_id], unique: true
  end
end
