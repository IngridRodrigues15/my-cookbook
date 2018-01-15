class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]

  def create
    @recipe = Recipe.find(params[:recipe])

    favorite = Favorite.new(user: current_user, recipe: @recipe)
    flash[:notice] = 'Receita adiciona aos favoritos' if favorite.save
    redirect_to recipe_path(@recipe)
  end

  def index
    @favorites = Favorite.where(user: current_user)
  end

end
