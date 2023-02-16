class Recipe < ApplicationRecord
  #   Associations
  has_many :recipe_foods, dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  #   Validations
  validates :name, presence: true
  validates :cooking_time, presence: true
  validates :preparation_time, presence: true
  validates :description, presence: true
end
