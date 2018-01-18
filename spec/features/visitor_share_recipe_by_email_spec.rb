require 'rails_helper'

feature 'User share recipe by email' do
  scenario 'successfully' do
    author = create :user, email: 'ana.maria.braga@gmail.com'
    recipe = create :recipe, title: 'Muffin de chocolate', author: author
    friend_email = 'amigo@gmail.com'
    message = 'Receita muito legal'

    visit root_path
    click_on recipe.title
    fill_in 'Email', with: friend_email
    fill_in 'Mensagem', with: message

    expect(RecipesMailer).to receive(:share).with(friend_email,
                    message, recipe.id).and_call_original

    click_on 'Enviar'

    expect(current_path).to eq recipe_path(recipe)
    expect(page).to have_content "#{recipe.title} enviada para #{friend_email}"
  end
end
