class HomeController < ApplicationController
  before_action :set_cusines, only: [:index]
  before_action :set_recipe_types, only: [:index]

  def index
    @recipes = Recipe.last(6)
  end
end
