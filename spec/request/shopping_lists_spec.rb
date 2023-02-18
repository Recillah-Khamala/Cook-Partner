require 'rails_helper'

RSpec.describe ShoppingListsController, type: :request do
  describe "GET #index" do 
    it "renders the index template" do
      get shopping_lists_path
      expect(response.body).to include('title')
    end
  end
end