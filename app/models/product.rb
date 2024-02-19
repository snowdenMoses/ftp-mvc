class Product < ApplicationRecord
  has_many :category_products, class_name: 'CategoryProduct'
  has_many :categories, through: :category_products, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many_attached :images

  belongs_to :user, counter_cache: true
  belongs_to :state, counter_cache: true

  normalizes :name, with: -> name {name.downcase}
  validates_presence_of :name, :description, :price, :stock, :state_id
  validates :price, presence: true
  validates :price, :numericality => { :greater_than => 0 }
  validates :stock, :numericality => { :greater_than => -1 }
  validates_associated :categories


  def images_as_thumbnail
      images.map do |image|
        image.variant(resize_to_limit: [200, 200]).processed
      end
  end

end
