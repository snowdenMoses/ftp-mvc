class CreatePersonalDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :personal_details do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.datetime :date_of_birth, null: false
      t.string :city, null: false
      t.string :gender, null: false
      t.string :phone_number, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
