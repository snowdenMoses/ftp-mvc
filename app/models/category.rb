class Category < ApplicationRecord
  normalizes :title, with: -> title { title.downcase}
  validates_presence_of :title
  has_many :category_products, class_name: "CategoryProduct", dependent: :destroy
  has_many :products, through: :category_products
  has_one_attached :image

  def image_as_thumbnail
    image.variant(resize_to_fit: [200, 200]).processed
  end
end
