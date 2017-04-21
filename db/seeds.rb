require 'open-uri'
require 'json'

# INGREDIENT = ["Cranberry", "Kiwi", "Blueberries", "Mango", "Watermelon", "Tomato", "Shit"]

COCKTAILS = ["Apple Martini", "Long Island Iced Tea", "Californication", "Pina Colada", "Margarita",
            "Caipirinha", "Mint Julep", "Mai Tai", "Mojito", "Cosmopolitan"]

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
  cocktail.remote_photo_url = "http://cdn.liquor.com/wp-content/uploads/2015/03/hub_classic_cocktail_margarita.jpg"
  cocktail.save
end

