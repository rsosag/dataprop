# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

# Create the communities in a initial load
puts 'Starting create comunas'

CSV.foreach(Rails.root.join('db/data/comunas.csv'), headers: true) do |row|
  Community.find_or_create_by!(row.to_h)

  print '.'
end

puts "\nFinished create comunas"
