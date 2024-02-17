class AddProductsCountsToStates < ActiveRecord::Migration[7.1]
  def change
    add_column :states, :products_count, :integer
    State.find_each {|state| State.reset_counters(state.id, :products)}
  end
end
