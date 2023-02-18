require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.new(name: 'Recillah', email: 'recilahk@gmail.com', password: '123456')
    @food = Food.create(name: 'beans', user: @user, price: 2, measurement_unit: 'kg', quantity: 4, user_id: @user.id)
  end

  it 'checks if food is successfully created' do
    expect(@food).to be_valid
  end

  it 'checks it is not valid if user is not present' do
    @food.user = nil
    expect(@food).to_not be_valid
  end

  it 'checks it is not created successfully without a name' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'checks it is not successfully created without a quantity' do
    @food.quantity = nil
    expect(@food).to_not be_valid
  end

  it 'checks if parameters are exactly what is saved ' do
    expect(@food.name).to eql 'beans'
  end

  it 'name should be between 3 - 10 characters' do
    subject.name = 'this should be false because it is more than 10'
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'price should not be nil' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'price should not be less than 0' do
    subject.price = -4
    expect(subject).to_not be_valid
  end

  it 'name should not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end
end
