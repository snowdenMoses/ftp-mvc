class AddUniquenessToUserRolesCompositeIndex < ActiveRecord::Migration[7.1]
  def change
    remove_index :user_roles, [:user_id, :role_id]
    add_index :user_roles, [:user_id, :role_id], unique: true
  end
end
