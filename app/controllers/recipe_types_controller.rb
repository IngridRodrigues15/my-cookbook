class RecipeTypesController < ApplicationController
  before_action :set_cusines, only: [:show]
  before_action :set_recipe_types, only: [:show]

  def show
    @recipe_type = RecipeType.find(params[:id])
    @recipes = Recipe.where(recipe_type_id: params[:id])
  end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.create(recipe_type_params)
    if @recipe_type.save
      redirect_to recipe_type_path(@recipe_type.id)
    else
      render 'new'
    end
  end

  private
    def recipe_type_params
      params.require(:recipe_type).permit(:name)
    end
end
