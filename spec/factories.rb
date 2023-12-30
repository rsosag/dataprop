# frozen_string_literal: true

FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory(:community) do
    name { Faker::Address.community }
  end

  factory(:property) do
    operation_type { Property::SALE_TYPE }
    association :user
    association :community
    price { 45_000 }
    currency { 'USD' }
    address { Faker::Address.full_address }
    number_of_rooms { 3 }
    number_of_bathrooms { 1 }
    description { 'Description' }
  end
end
