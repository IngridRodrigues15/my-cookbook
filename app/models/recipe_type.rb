class RecipeType < ApplicationRecord
  validates :name, presence: { message: "Você deve informar o tipo da receita" }

  def to_s
    name
  end
end
