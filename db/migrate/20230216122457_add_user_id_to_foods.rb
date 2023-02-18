class AddUserIdToFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :user_id, :bigint, null: false
    add_foreign_key :foods, :users, column: :user_id
  end
end
