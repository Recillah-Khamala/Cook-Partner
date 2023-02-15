class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    
  # associations
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
  
  # validations
  validates :name, presence: true, uniqueness: true
end
