require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user = User.create(name: 'Recillah', email: 'recilahk@gmail.com', password: '123456')
    @recipe = Recipe.create(user: @user, name: 'githeri', preparation_time: 10, cooking_time: 3,
        description: 'boil till tender', public: false)
    @food = Food.create(name: 'beans', user: @user, price: 2, measurement_unit: 'kg', quantity: 4, user_id: @user.id)
    @recipe_food = @recipe.recipe_foods.create(quantity: 5, recipe_id: @recipe.id, food_id: @food.id)
  end

  it 'checks if recipe food creation is successful' do
    expect(@recipe_food).to be_valid
  end

  it 'checks it is not valid without a recipe id ' do
    @recipe_food.recipe_id = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'checks it is not valid without a food id ' do
    @recipe_food.food_id = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'the value of quantity less than 0 should be invalid' do
    subject.quantity = -5
    expect(subject).to_not be_valid
  end

  it 'the exact quantity should be 4' do
    subject.quantity = 4
    expect(subject.quantity).to eq 4
  end

  it 'quantity should be valid' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
end