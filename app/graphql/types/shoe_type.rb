# frozen_string_literal: true

module Types
  class ShoeType < Types::BaseObject
    description "The shoe entity"

    field :model, String, null: false, description: "Model name"

    field :stores, [Types::StoreType], null: true do
      argument :name,
        String,
        required: false,
        description: "Store name filter"
    end

    field :stock_alerts, [Types::InventoryAlertType], null: true, description: "Alerts from stores with low stock" do
      argument :threshold, Integer, required: false, description: "Set threshold for low stock"
    end

    def stores(name: nil)
      return object.stores.where(name: name) if name

      object.stores
    end

    def stock_alerts(threshold: 10)
      object.inventory_items.where(available_stock: (..threshold)).map do |item|
        { store: item.store.name, available_stock: item.available_stock }
      end
    end
  end
end
