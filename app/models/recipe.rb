class Recipe < ApplicationRecord
  belongs_to :cuisine

  validates :title, :recipe_type, :cuisine, :difficulty, presence: true
end
