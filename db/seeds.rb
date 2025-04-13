# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
company = Company.new(name: "Total", siret: "123456789010")
company.save!
company = Company.first
(1..25).each do |n|
  type = rand(0..2)
  quantity = rand(5..99)
  emission = Emission.new(emission_type: type, emission_quantity: quantity, company: company)
  emission.save!
end