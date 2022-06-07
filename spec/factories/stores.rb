FactoryBot.define do
  factory :store do
    name { "#{Faker::Game.title} Store #{rand(1..10)}" }
  end
end
