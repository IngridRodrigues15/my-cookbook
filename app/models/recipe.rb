class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe_type
  belongs_to :user

  has_many :favorites
  has_many :users, through: :favorites

  alias_attribute :author, :user
  validates :title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, presence: { message: "Você deve informar todos os dados da receita" }

  def is_author?(user)
    self.author.eql?(user)
  end
end
