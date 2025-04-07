# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Destroying users...'
User.destroy_all

# Create a user with admin role
User.create!(
  email: 'admin@example.com',
  first_name: 'Alex',
  last_name: 'Dog-Harmonie',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)
puts 'Done...'
