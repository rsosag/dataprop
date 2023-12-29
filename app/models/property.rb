class Property < ApplicationRecord
  belongs_to :community

  has_many_attached :images

  validates :price, numericality: { greater_than: 0 }
  validates :community_id, presence: true
end
