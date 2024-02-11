class Category < ApplicationRecord
  normalizes :title, with: -> title { title.downcase}
  validates_presence_of :title
  has_many :category_products, class_name: "CategoryProduct", dependent: :destroy
  has_many :products, through: :category_products
  has_one_attached :image
end
