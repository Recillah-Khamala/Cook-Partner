class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :food, null: false, foreign_key: true, type: :bigint
      t.references :recipe, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end
