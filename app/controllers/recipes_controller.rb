class RecipesController < ApplicationController
  before_action :set_cusines, only: [:show, :new, :edit]
  before_action :set_recipe_types, only: [:show, :new, :edit]

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      set_cusines
      set_recipe_types
      render 'new' 
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      set_cusines
      set_recipe_types
      render 'edit'
    end
  end

  def search
    @search_term = params[:q]
    @recipes = Recipe.where(title: @search_term)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :portion, :cook_time, :difficulty, :ingredients, :method)
    end
end