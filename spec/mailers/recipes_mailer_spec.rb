require "rails_helper"

RSpec.describe RecipesMailer, type: :mailer do
  describe "share recipe" do
    it "render the correct email" do
      author = create :user, email: 'ana.maria.braga@gmail.com'
      recipe = create :recipe, title: 'Muffin de chocolate', author: author
      email = 'amigo@gmail.com'
      message = 'Receita muito legal'
      mail = RecipesMailer.share(email, message, recipe.id)

      expect(mail.to).to eq(["#{email}"])
      expect(mail.from).to eq(['no-reply@cookbook.com'])
      expect(mail.subject).to eq("Seu amigo compartilhou #{recipe.title} com você")
      expect(mail.body).to include message
      expect(mail.body).to have_link(recipe.title, :href=> recipe_url(recipe))
    end
  end
end
