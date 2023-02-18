class ShoppingListsController < ApplicationController
  def index
    @recipes = RecipeFood.includes(:food).all
  end
end
