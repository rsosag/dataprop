module PropertiesHelper
  def types_collection
    [
      [I18n.t(Property::RENT_TYPE), Property::RENT_TYPE],
      [I18n.t(Property::SALE_TYPE), Property::SALE_TYPE]
    ]
  end

  def currencies_collection
    %w[USD CLP]
  end

  def communities_collection
    Community.pluck(:name, :id)
  end
end
