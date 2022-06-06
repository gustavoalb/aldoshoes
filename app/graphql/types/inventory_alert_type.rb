# frozen_string_literal: true

module Types
  class InventoryAlertType < Types::BaseObject
    description "The object for describing low stock"

    field :store, String, null: true, description: "Store with low stock"
    field :model, String, null: true, description: "Shoe model with low stock"
    field :available_stock, Integer, null: false, description: "Available stock"
  end
end
