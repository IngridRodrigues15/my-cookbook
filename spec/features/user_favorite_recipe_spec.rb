require 'rails_helper'

feature 'User favorite recipe' do
  scenario 'successfully' do
    user = User.create(email: 'ingrid@gmail.com', password: '123456')
    login_as(user, :scope => :user)

    #cria os dados necessários
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')
    author = User.create(email: 'ana.maria.braga@gmail.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')

    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: brazilian_cuisine, author: author, difficulty: 'Médio',
                          cook_time: 50,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    # simula a ação do usuário
    visit root_path
    click_on recipe.title
    click_on 'Marcar como favorito'

    expect(page).to have_content('Receita adiciona aos favoritos')
  end
  scenario 'and see favorites list' do
    user = User.create(email: 'ingrid@gmail.com', password: '123456')
    login_as(user, :scope => :user)

    #cria os dados necessários
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')
    author = User.create(email: 'ana.maria.braga@gmail.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')

    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: brazilian_cuisine, author: author, difficulty: 'Médio',
                          cook_time: 50,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    another_recipe = Recipe.create(title: 'Feijoada', recipe_type: recipe_type,
                                  cuisine: brazilian_cuisine, author: author, difficulty: 'Difícil',
                                  ingredients: 'Feijao, paio, carne seca',
                                  method: 'Cozinhar o feijao e refogar com as carnes já preparadas',
                                  cook_time: 90)

    third_recipe = Recipe.create(title: 'Salada de cenoura', recipe_type: recipe_type,
                                 cuisine: brazilian_cuisine, author: author, difficulty: 'Facil',
                                 cook_time: 60,
                                 ingredients: 'Cenoura e legumes',
                                 method: 'Cozinhe a cenoura, misture com os legumes')

    favorite = Favorite.create(user: user, recipe: recipe)
    favorite = Favorite.create(user: user, recipe: another_recipe)
    # simula a ação do usuário
    visit root_path
    click_on 'Meus favoritos'

    expect(page).to have_link(recipe.title)
    expect(page).to have_link(another_recipe.title)
    expect(page).not_to have_link(third_recipe.title)
  end

#user must be authenticate to favorite a receipe
#favorites list is empty
end
