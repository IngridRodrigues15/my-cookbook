FactoryBot.define do
  factory :recipe do
    title 'Bolo de cenoura'
    difficulty 'Médio'
    ingredients 'Cenoura, acucar, oleo e chocolate'
    add_atribute(:method) {'Misturar tudo, bater e assar'}
    cook_time 60
    recipe_type
    cuisine
    author
  end
end
