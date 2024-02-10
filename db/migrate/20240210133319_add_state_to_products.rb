class AddStateToProducts < ActiveRecord::Migration[7.1]
  def up
    add_reference :products, :state,  null: true, foreign_key: true
  end

  def down
    add_reference :products, :state, null: false,  foreign_key: true
  end
end
