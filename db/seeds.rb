# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'destroy all data'

Pizza.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
User.destroy_all
Cart.destroy_all

puts 'Add ingredients'

Ingredient.create(name: 'cheese')
Ingredient.create(name: 'tomato sauce')
Ingredient.create(name: 'garlic')
Ingredient.create(name: 'mozzarella')
Ingredient.create(name: 'grated')
Ingredient.create(name: 'parmesan')
Ingredient.create(name: 'mushroom')
Ingredient.create(name: 'pineapple')
Ingredient.create(name: 'jam')

print 'Add users'

10.times do
  User.create(email: Faker::Internet.email)
  print '*'
end
puts ''
print 'Add pizzas'

20.times do
  Pizza.create(
                name: Faker::Superhero.name,
                price: rand(5..12),
                ingredient: Ingredient.all.sample,
                description: Faker::Lorem.sentence(3))
  print '*'
end

puts ''
puts '------------------'
puts 'END'
