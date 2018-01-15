class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe_type
  belongs_to :user

  has_many :favorites
  has_many :users, through: :favorites

  alias_attribute :author, :user
  validates :title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, :method, presence: { message: "Você deve informar todos os dados da receita" }
end
