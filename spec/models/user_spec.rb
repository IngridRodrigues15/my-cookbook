require "rails_helper"

RSpec.describe User, :type => :model do
  context "User" do
    it "favorite recipe" do
      user = create(:user, email: 'ana.maria.braga@gmail.com')
      recipe = create(:recipe, author: user )
      create(:favorite, recipe: recipe, user: user)

      expect(user.favorited?(recipe)). to be true
    end
    it "not favorite recipe" do
      user = create(:user, email: 'ana.maria.braga@gmail.com')
      recipe = create(:recipe, author: user )

      expect(user.favorited?(recipe)). to be false
    end
    it "favorite recipe is nil" do
      user = create(:user)

      expect(user.favorited?(nil)). to be false
    end
  end
end
