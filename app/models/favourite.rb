class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates_presence_of :user_id, :product_id

  enum status: [:active, :inactive]
end
