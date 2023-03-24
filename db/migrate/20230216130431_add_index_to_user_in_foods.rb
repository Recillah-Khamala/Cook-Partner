class AddIndexToUserInFoods < ActiveRecord::Migration[7.0]
  def change
    add_index :foods, :user_id, name: "index_foods_on_user_id"
  end
end
