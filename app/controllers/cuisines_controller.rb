class CuisinesController < ApplicationController
  before_action :set_cusines, only: [:show]
  before_action :set_recipe_types, only: [:show] 

  def show
    @cuisine = Cuisine.find(params[:id])
    @recipes = Recipe.where(cuisine_id: params[:id])
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