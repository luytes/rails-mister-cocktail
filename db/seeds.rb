require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
COCKTAILS = ["Apple Martini", "Long Island Iced Tea", "Californication", "Pina Colada", "Margarita",
            "Caipirinha", "Mint Julep", "Mai Tai", "Mojito", "Cosmopolitan"]
# INGREDIENT = ["Cranberry", "Kiwi", "Blueberries", "Mango", "Watermelon", "Tomato", "Shit"]

file = open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
json = file.read
parsed = JSON.parse(json)
INGREDIENT = parsed["drinks"].map { |hash| hash.values.first  }

Cocktail.destroy_all
Ingredient.destroy_all

INGREDIENT.each do |ing|
  Ingredient.create(name: ing)
end

COCKTAILS.each do |cock|
  numb_ing = (2..5).to_a.sample
  cocktail = Cocktail.new(name: cock)
  cocktail.ingredients = Ingredient.all.sample(numb_ing)
  cocktail.save
end


# parsed["drinks"].each do |ing|
#   Ingredient.create(name: ing["strIngredient1"])
# end

# # (1..10).to_a.sample do
# #   Ingredient.create(name: max_ingredients.sample)
# # end

# COCKTAILS.each do |cock|
#   Cocktail.create(name: cock, ingredients: )
# end


