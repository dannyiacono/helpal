# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all

puts "Removed all existing categories"

categories = ["Business", "Housing", "Legal", "Travel", "Tech", "Health"]

categories.each do |categorie|
  Category.create(name: categorie)
end

puts "6 Categories created"
