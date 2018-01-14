require 'rails_helper'

feature 'User authenticate' do
  scenario 'User sign in using an email and a password' do
    user = User.create(email: 'ingrid@gmail.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    within('div.actions') do
      click_on 'Entrar'
    end

    expect(page).to have_content("Bem-vindo #{user.email}")
    expect(page).not_to have_link('Entrar')
  end
  scenario 'User logout' do
    user = User.create(email: 'ingrid@gmail.com', password: '123456')
    login_as(user, :scope => :user)

    visit root_path
    click_on 'Sair'

    expect(page).not_to have_content("Bem-vindo #{user.email}")
    expect(page).not_to have_link('Sair')
    expect(page).to have_link('Entrar')
  end
  scenario 'User must be authenticate to create a recipe ' do
    visit root_path
    click_on 'Enviar uma receita'

    expect(page).to have_content('You need to sign in or sign up before continuing')
    expect(page).not_to have_content('Criar receita')
  end
  scenario 'User authenticate can create a recipe ' do
    user = User.create(email: 'ingrid@gmail.com', password: '123456')
    login_as(user, :scope => :user)

    visit root_path
    click_on 'Enviar uma receita'

    expect(page).to have_content('Criar receita')
  end
   scenario 'User must be authenticate to edit a recipe ' do
     #cria os dados necessários
     cuisine = Cuisine.create(name: 'Brasileira')
     recipe_type = RecipeType.create(name: 'Sobremesa')
     recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio', cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

     # simula a ação do usuário
     visit root_path
     click_on recipe.title
     click_on 'Editar'

     expect(page).to have_content('You need to sign in or sign up before continuing')
     expect(page).not_to have_content('Editar receita')
  end
  scenario 'User authenticate can edit a recipe ' do
    user = User.create(email: 'ingrid@gmail.com', password: '123456')
    login_as(user, :scope => :user)

    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio', cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')


    # simula a ação do usuário
    visit root_path
    click_on recipe.title
    click_on 'Editar'

    expect(page).to have_content('Editar receita')
  end
end
