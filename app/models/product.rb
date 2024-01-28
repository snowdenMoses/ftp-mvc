class Product < ApplicationRecord
  has_many :category_products, class_name: 'CategoryProduct'
  has_many :categories, through: :category_products, dependent: :destroy
  belongs_to :user

  normalizes :name, with: -> name {name.downcase}
  validates_presence_of :name, :description, :price, :stock
  validates :price, presence: true
  validates :price, :numericality => { :greater_than => 0 }
  validates :stock, :numericality => { :greater_than => -1 }
end
