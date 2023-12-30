require 'rails_helper'

RSpec.describe Property, type: :model do
  let(:property) { FactoryBot.create(:property) }

  describe '#valid?' do
    it 'is valid with valid attributes' do
      expect(property).to be_valid
    end

    it 'is not valid without a user' do
      property.user = nil

      expect(property).to_not be_valid
    end

    it 'is not valid without a community' do
      property.community = nil

      expect(property).to_not be_valid
    end

    it 'is not valid without a operation_type' do
      property.operation_type = nil

      expect(property).to_not be_valid
    end

    it 'is not valid with invalid operation_type' do
      property.operation_type = 'other'

      expect(property).to_not be_valid
    end

    it 'is not valid without a price' do
      property.price = nil

      expect(property).to_not be_valid
    end

    it 'is not valid with price zero' do
      property.price = 0

      expect(property).to_not be_valid
    end

    it 'is not valid with price negative' do
      property.price = 0

      expect(property).to_not be_valid
    end

    it 'is not valid with area zero' do
      property.area = 0

      expect(property).to_not be_valid
    end

    it 'is not valid with area negative' do
      property.area = -1

      expect(property).to_not be_valid
    end

    it 'is not valid without a number_of_rooms' do
      property.number_of_rooms = nil

      expect(property).to_not be_valid
    end

    it 'is not valid with number_of_rooms zero' do
      property.number_of_rooms = 0

      expect(property).to_not be_valid
    end

    it 'is not valid with number_of_rooms negative' do
      property.number_of_rooms = -1

      expect(property).to_not be_valid
    end

    it 'is not valid without a number_of_bathrooms' do
      property.number_of_bathrooms = nil

      expect(property).to_not be_valid
    end

    it 'is not valid with number_of_bathrooms zero' do
      property.number_of_bathrooms = 0

      expect(property).to_not be_valid
    end

    it 'is not valid with number_of_bathrooms negative' do
      property.number_of_bathrooms = -1

      expect(property).to_not be_valid
    end

    it 'is not valid if description contain url' do
      property.description = 'Text here http://foo.example.org/bla and here mailto:test@example.com and here also'

      expect(property).to_not be_valid
    end

    it 'is not valid if description contain email' do
      property.description = 'Text here test@example.com and here also'

      expect(property).to_not be_valid
    end

    it 'is not valid if description contain phone number' do
      property.description = 'Text here (555)-123-4567 and here also'

      expect(property).to_not be_valid
    end
  end
end
