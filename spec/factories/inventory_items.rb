# frozen_string_literal: true

FactoryBot.define do
  factory :inventory_item do
    store { create(:store) }
    shoe { create(:shoe) }
    available_stock { rand(1..100) }
  end
end
