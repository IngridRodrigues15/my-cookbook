FactoryBot.define do
  factory :recipe do
    title 'Bolo de cenoura'
    difficulty 'Médio'
    ingredients 'Cenoura, acucar, oleo e chocolate'
    add_attribute(:method) { 'Misturar e assar' }
    cook_time 60
    recipe_type
    cuisine
    association :author, factory: :user
  end
end
