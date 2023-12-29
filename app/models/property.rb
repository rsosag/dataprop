class Property < ApplicationRecord
  belongs_to :community
  belongs_to :user

  has_many_attached :images

  validates :price, numericality: { greater_than: 0 }
  validates :community_id, presence: true
  validates :user_id, presence: true
end
