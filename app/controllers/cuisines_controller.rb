class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
    @recipes = Recipe.where(cuisine_id: params[:id])
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.create(cuisine_params)
    if @cuisine.save
      redirect_to cuisine_path(@cuisine.id)
    else
      render 'new'
    end
  end

  private
    def cuisine_params
      params.require(:cuisine).permit(:name)
    end
end