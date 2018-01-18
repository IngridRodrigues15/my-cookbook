# Preview all emails at http://localhost:3000/rails/mailers/recipes_mailer
class RecipesMailerPreview < ActionMailer::Preview
   def share
     email = 'amigo@gmail.com'
     message = 'Receita muito legal'
     user = User.create(email: 'ingrid@gmail.com', password: '123456')
     cuisine = Cuisine.create(name: 'Brasileira')
     recipe_type = RecipeType.create(name: 'Sobremesa')
     recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, author: user, difficulty: 'Médio',
                           ingredients: 'Cenoura, acucar, oleo e chocolate',
                           method: 'Misturar tudo, bater e assar',
                           cook_time: 60)

     RecipesMailer.share(email, message, recipe.id)
   end
end
