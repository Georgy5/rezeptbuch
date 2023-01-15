# Use Faker to generate fake data
require "faker"

# Destroy exisitng Recipes
puts "Cleaning up database..."
Recipe.destroy_all
puts "Database cleaned"

# Create a User to author some recipes
puts "Creating a User"
user = User.create(first_name: "Max", last_name: "Mustermann", email: "max@example.com",
          password: 'foobar', password_confirmation: 'foobar')

# Create around 5 or more recipes
puts "Creating 8 fake recipes..."
8.times do
  recipe = Recipe.new(
    title:        Faker::Food.dish,
    author:       user.name,
    description:  Faker::Food.description
  )
  recipe.user = user
  recipe.save!
end
puts "Finished!"
