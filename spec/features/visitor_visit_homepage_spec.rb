require 'rails_helper'

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'CookBook')
    expect(page).to have_css('p', text: 'Bem-vindo ao maior livro de receitas online')
  end

  scenario 'and view recipe' do
    #cria os dados necessários
    user = User.create(email: 'ingrid@gmail.com', password: '123456')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, author: user, difficulty: 'Médio',
                          ingredients: 'Cenoura, acucar, oleo e chocolate',
                          method: 'Misturar tudo, bater e assar',
                          cook_time: 60)

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")
  end

  scenario 'and view recipes list' do
    #cria os dados necessários
    user = User.create(email: 'ingrid@gmail.com', password: '123456')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, author: user, difficulty: 'Médio',
                          ingredients: 'Cenoura, acucar, oleo e chocolate',
                          method: 'Misturar tudo, bater e assar',
                          cook_time: 60)

    another_recipe_type = RecipeType.create(name: 'Prato Principal')
    another_recipe = Recipe.create(title: 'Feijoada', recipe_type: another_recipe_type,
                          cuisine: cuisine, author: user, difficulty: 'Difícil',
                          ingredients: 'Feijao, paio, carne seca',
                          method: 'Cozinhar o feijao e refogar com as carnes já preparadas',
                          cook_time: 90)

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")

    expect(page).to have_css('h1', text: another_recipe.title)
    expect(page).to have_css('li', text: another_recipe.recipe_type.name)
    expect(page).to have_css('li', text: another_recipe.cuisine.name)
    expect(page).to have_css('li', text: another_recipe.difficulty)
    expect(page).to have_css('li', text: "#{another_recipe.cook_time} minutos")
  end
  scenario 'and view last 6 recipes' do
    #cria os dados necessários
    user = create(:user, email: 'ana.maria.braga@gmail.com')
    cuisine = create(:cuisine)
    recipe_type = create(:recipe_type)

    first_recipe = create(:recipe, title:'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, author: user )
    second_recipe = create(:recipe, title:'Bolo de chocolate', recipe_type: recipe_type,
                          cuisine: cuisine, author: user )
    third_recipe = create(:recipe, title:'Bolo de brigadeiro', recipe_type: recipe_type,
                          cuisine: cuisine, author: user )
    fourth_recipe = create(:recipe, title:'Bolo de fubá', recipe_type: recipe_type,
                          cuisine: cuisine, author: user )
    fifth_recipe = create(:recipe, title:'Bolo de leite', recipe_type: recipe_type,
                          cuisine: cuisine, author: user )
    sixth_recipe = create(:recipe, title:'Bolo de morango', recipe_type: recipe_type,
                          cuisine: cuisine, author: user )
    seventh_recipe = create(:recipe, title:'Bolo de amora', recipe_type: recipe_type,
                          cuisine: cuisine, author: user )

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_link('Ver todas as receitas')
    expect(page).not_to have_css('h1', text: first_recipe.title)
    expect(page).to have_css('h1', text: second_recipe.title)
    expect(page).to have_css('h1', text: third_recipe.title)
    expect(page).to have_css('h1', text: fourth_recipe.title)
    expect(page).to have_css('h1', text: fifth_recipe.title)
    expect(page).to have_css('h1', text: sixth_recipe.title)
    expect(page).to have_css('h1', text: seventh_recipe.title)
  end
  scenario 'and user see all recipes' do
    #cria os dados necessários
    user = create(:user, email: 'ana.maria.braga@gmail.com')
    cuisine = create(:cuisine)
    recipe_type = create(:recipe_type)
    create_list(:recipe,10,recipe_type: recipe_type,
                          cuisine: cuisine, author: user )

    visit root_path
    click_on 'Ver todas as receitas'

    expect(page).to have_selector('h1.recipe_title', count: 10)
  end
end
