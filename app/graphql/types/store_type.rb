# frozen_string_literal: true

module Types
  class StoreType < Types::BaseObject
    description "The store entity"

    field :name, String, null: false, description: "Store name"

    field :shoes, [Types::ShoeType], null: true do
      argument :model,
        [String],
        required: false,
        description: "Model name filter"
    end

    field :stock_alerts, [Types::InventoryAlertType], null: true, description: "Alerts from stores with low stock" do
      argument :threshold, Integer, required: false, description: "Set threshold for low stock"
    end

    def shoes(model: nil)
      return object.shoes.where(model: model) if model

      object.shoes
    end

    def stock_alerts(threshold: 10)
      object.inventory_items.where(available_stock: (..threshold)).map do |item|
        { model: item.shoe.model, available_stock: item.available_stock }
      end
    end
  end
end
