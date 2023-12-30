class Property < ApplicationRecord
  include Filterable

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

  scope :filter_by_operation_type, ->(operation_type) { where operation_type: }
  scope :filter_by_community, ->(community_id) { where community_id: }
  scope :filter_by_number_of_rooms, ->(number_of_rooms) { where number_of_rooms: }

  delegate :name, to: :community, prefix: true, allow_nil: false

  def rent?
    operation_type == RENT_TYPE
  end

  def sale?
    operation_type == SALE_TYPE
  end
end
