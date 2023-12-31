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
  validates :area, numericality: { greater_than: 0, allow_blank: true }
  validates :number_of_rooms, numericality: { greater_than: 0, only_integer: true }
  validates :number_of_bathrooms, numericality: { greater_than: 0, only_integer: true }

  validates :description, no_url: true
  validates :description, no_contain: true
  validates :description, no_contain: { format: /\b\d{3}\)?[\s|-]?\d{3}-?\d{4}\b/i,
                                        message: I18n.t('cannot_contain_phone_numer') }

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

  def price_in_usd?
    currency == 'USD'
  end

  def price_in_clp?
    currency == 'CLP'
  end
end
