require "rails_helper"

RSpec.describe Recipe, :type => :model do
  context "Recipe" do
    it "user is recipe author" do
      user = create(:user, email: 'ana.maria.braga@gmail.com')
      recipe = create(:recipe, author: user )

      expect(recipe.is_author?(user)). to be true
    end
    it "user is not recipe author" do
      user = create(:user, email: 'ana.maria.braga@gmail.com')
      author = create(:user, email: 'palmerinha@gmail.com')
      recipe = create(:recipe, title:'Bolo de cenoura', author: author )

      expect(recipe.is_author?(user)). to be false
    end
    it "user is null" do
      recipe = create(:recipe)
      expect(recipe.is_author?(nil)). to be false
    end
  end
end
