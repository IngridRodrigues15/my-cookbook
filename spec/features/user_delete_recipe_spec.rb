require 'rails_helper'

feature 'User delete recipe' do
  scenario 'successfully' do
    #cria os dados necessários
    user = User.create(email: 'ingrid@gmail.com', password: '123456')
    login_as(user, :scope => :user)

    italian_cuisine = Cuisine.create(name: 'Italiana')
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')

    main_type = RecipeType.create(name: 'Prato Principal')
    dessert_type = RecipeType.create(name: 'Sobremesa')

    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: dessert_type,
                          cuisine: brazilian_cuisine, author: user, difficulty: 'Médio',
                          cook_time: 50,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    another_recipe = Recipe.create(title: 'Lasanha', recipe_type: main_type,
                          cuisine: italian_cuisine, author: user, difficulty: 'Médio',
                          cook_time: 50,
                          ingredients: 'Massa, queijo e presunto',
                          method: 'Coloque os ingredientes em camadas')


    # simula a ação do usuário
    visit root_path
    click_on recipe.title
    click_on 'Excluir Receita'

    expect(page).not_to have_css('h1', text: recipe.title)
    expect(page).not_to have_link(recipe.title)
    expect(page).to have_css('h1', text: another_recipe.title)
    expect(page).to have_link(another_recipe.title)
  end
  scenario 'and only the author can delete' do
    user = create :user, email: 'ingrid@teste.com'
    author = create :user, email: 'ana.maria.braga@gmail.com'
    recipe = create :recipe, author: author

    # simula a ação do usuário
    login_as user
    visit root_path
    click_on recipe.title

    expect(page).not_to have_link('Excluir Receita')
  end
end
