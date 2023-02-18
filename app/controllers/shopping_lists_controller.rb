class ShoppingListsController < ApplicationController
  def index
    @recipes = RecipeFood.includes(:food)
  end
end
