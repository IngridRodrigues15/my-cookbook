class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def set_cusines
  	 @cuisines = Cuisine.all
  end

  def set_recipe_types
  	 @recipe_types = RecipeType.all
  end
end
