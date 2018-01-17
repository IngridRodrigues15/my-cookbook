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

  def destroy
    @recipe = Recipe.find(params[:recipe])
    favorite = Favorite.find_by(user: current_user, recipe: @recipe)
    favorite.destroy
    flash[:notice] = 'Receita removida aos favoritos'
    redirect_to recipe_path(@recipe)
  end

end
