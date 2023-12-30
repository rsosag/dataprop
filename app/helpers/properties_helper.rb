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

  def convert_price_for(property)
    response = RestClient.get('https://mindicador.cl/api/dolar')
    parsed_response = JSON.parse(response)
    indicator_value = parsed_response['serie']&.first&.[]('valor').to_f

    converted_value = property.price_in_usd? ? (property.price * indicator_value) : (property.price / indicator_value)

    ActiveSupport::NumberHelper.number_to_currency(converted_value, unit: property.price_in_usd? ? 'CLP' : 'USD')
  end
end
