class Property < ApplicationRecord
  RENT_TYPE = 'rent'
  SALE_TYPE = 'sale'

  belongs_to :community
  belongs_to :user

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validates :operation_type, inclusion: [RENT_TYPE, SALE_TYPE], allow_blank: false
  validates :price, numericality: { greater_than: 0 }
  validates :area, numericality: { greater_than: 0 }
  validates :number_of_rooms, numericality: { greater_than: 0, only_integer: true, allow_blank: false }
  validates :number_of_bathrooms, numericality: { greater_than: 0, only_integer: true, allow_blank: false }

  delegate :name, to: :community, prefix: true, allow_nil: false

  def rent?
    operation_type == RENT_TYPE
  end

  def sale?
    operation_type == SALE_TYPE
  end
end
