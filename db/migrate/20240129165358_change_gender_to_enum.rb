class ChangeGenderToEnum < ActiveRecord::Migration[7.1]
  def change
    remove_column :personal_details, :gender
    add_column :personal_details, :gender, :integer
  end
end
