require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'Recillah', email: 'recilahk@gmail.com', password: '123456')
    @recipe = Recipe.create(user: @user, name: 'githeri', preparation_time: 10, cooking_time: 3,
                            description: 'boil till tender', public: false)
  end

  it 'checks if recipe creation is successful' do
    expect(@recipe).to be_valid
  end

  it 'checks it is not valid without a preparation time ' do
    @recipe.preparation_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'checks it is not valid without a cooking time ' do
    @recipe.cooking_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'checks it is not valid without a description ' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid
  end

  it 'checks it is not valid without a name ' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'checks if it saves actual name ' do
    expect(@recipe.name).to eql 'githeri'
  end

  it 'checks if it saves actual description ' do
    expect(@recipe.description).to eql 'boil till tender'
  end
end
