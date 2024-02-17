class Favourite < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :product, counter_cache: true
  validates_presence_of :user_id, :product_id

  enum status: [:active, :inactive]
end
