class RemoveRoleIdFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :users, :role
  end
end
