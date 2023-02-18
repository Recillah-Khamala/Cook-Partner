# class Recipe < ApplicationRecord
#   #   Associations
#   has_many :recipe_foods, dependent: :destroy
#   belongs_to :user, class_name: 'User', foreign_key: 'user_id'

#   #   Validations
#   validates :name, presence: true
#   validates :cooking_time, presence: true
#   validates :preparation_time, presence: true
#   validates :description, presence: true
# end

class Recipe < ApplicationRecord
  belongs_to :user 
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, :preparation_time, :cooking_time, :description, presence: true
end
