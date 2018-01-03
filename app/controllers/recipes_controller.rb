class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(title: params[:recipe][:title], recipe_type_id: params[:recipe][:recipe_type_id], cuisine_id: params[:recipe][:cuisine_id], portion: params[:recipe][:portion], cook_time: params[:recipe][:cook_time], difficulty: params[:recipe][:difficulty], ingredients: params[:recipe][:ingredients], method: params[:recipe][:method])
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render 'new' 
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to root_path
  end
end