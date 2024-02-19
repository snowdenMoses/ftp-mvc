class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles, class_name: "UserRole"

  validates_presence_of :title

  normalizes :title, with: -> title { title.split(" ").join("_").downcase }
end
