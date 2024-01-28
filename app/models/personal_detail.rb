class PersonalDetail < ApplicationRecord
  belongs_to :user

  validates_presence_of :first_name, :last_name, :date_of_birth, :city, :gender, :phone_number

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
