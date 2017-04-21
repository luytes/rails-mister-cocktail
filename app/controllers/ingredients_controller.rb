class IngredientsController < ApplicationController
  def show
    # how to actually match the coktail id??
    @ingredient = Ingredient.find(params[:id])
    # @doses = Dose.where(ingredient_id: @ingredient.id)
    # @cocktails = doses.map(&:cocktail).uniq!
    @cocktails = @ingredient.cocktails

    # @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient.cocktail_id = @cocktail.id
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
