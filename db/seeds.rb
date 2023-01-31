# Use Faker to generate fake data
require "faker"

# Destroy exisitng Recipes and Reviews
puts "Cleaning up database..."
Recipe.destroy_all
Review.destroy_all
puts "Database cleaned of recipes and reviews"
# Users aren't destroyed
puts "Note: Users were not removed!"

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
puts "...finished creating recipes"

# Create some reviews rating the recipes
recipes = Recipe.all

puts "Creating reviews for #{recipes.count} recipes..."
recipes.each do |recipe|
  review = Review.new(
    rating: (1..5).to_a.sample
  )
  review.recipe = recipe
  review.user = user
  review.save!
end
puts "...finished creating reviews"

puts "Finished!"
