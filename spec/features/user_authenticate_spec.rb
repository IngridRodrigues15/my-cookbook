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
  #scenario 'User logout' do
  
  #end
  #scenario 'User must be authenticate to create a recipe ' do
  
  #end
   #scenario 'User must be authenticate to edit a recipe ' do
  
  #end
end
