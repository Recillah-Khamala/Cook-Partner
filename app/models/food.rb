class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates :name, :measurement_unit, :price, :quantity, presence: true
end

# class Recipe < ApplicationRecord
#   attr_accessor :public

#   before_save :set_public

#   belongs_to :user, class_name: 'User', foreign_key: :user_id
#   has_many :recipe_foods, dependent: :destroy

#   # Validations
#   validates :name, presence: true
#   validates :description, presence: true
#   validates :public, presence: true

#   # Set public recipe attributes
#   private

#   def set_public
#     self.public ||= false
#   end
# end
