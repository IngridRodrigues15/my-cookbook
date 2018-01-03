class RecipeTypesController < ApplicationController
  def show
    @recipe_type = RecipeType.find(params[:id])
    @recipes = Recipe.where(recipe_type_id: params[:id])
  end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.create(name: params[:recipe_type][:name])
    if @recipe_type.save
      redirect_to recipe_type_path(@recipe_type.id)
    else
      render 'new'
    end
  end
end
