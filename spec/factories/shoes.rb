# frozen_string_literal: true

FactoryBot.define do
  factory :shoe do
    model { "#{Faker::Game.title} Sneakers #{rand(1..10)}" }
  end
end
