class Food < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, dependent: :destroy

  # validations
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
