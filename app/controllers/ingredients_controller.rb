class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient.cocktail_id = @cocktail.id
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
