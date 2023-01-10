# Use Faker to generate fake data
require "faker"

# Destroy exisitng Recipes
puts "Cleaning up database..."
Recipe.destroy_all
puts "Database cleaned"

# Create around 5 or more recipes
puts "Creating 8 fake recipes..."
8.times do
  Recipe.create!(
    title:        Faker::Food.dish,
    author:       Faker::Name.name,
    description:  Faker::Food.description
  )
end
puts "Finished!"
