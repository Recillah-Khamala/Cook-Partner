class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[public show]

  def index
    @recipes = Recipe.all.includes([:user])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public))
    @recipe.user = current_user

    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_path
    else
      flash[:error] = @recipe.errors.full_messages
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true).includes([:recipe_foods], [:foods]) # Solve N+1 problem
  end

  def update
    @recipe = Recipe.find(params[:id])
    @public = @recipe.public ? false : true
    Recipe.update(@recipe.id, public: @public)
    redirect_to recipe_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe successfully destroyed'
    redirect_back(fallback_location: recipes_path)
  end
end
