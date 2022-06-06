# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :stores, Types::StoreType.connection_type, null: false, description: "List of all stores of the franchise" do
      argument :name, [String], required: false, description: "Filter stores by name"
    end

    field :shoes, Types::ShoeType.connection_type, null: false, description: "List of all shoes of the franchise" do
      argument :model, [String], required: false, description: "Filter shoes by model"
    end

    field :inventory_items, Types::InventoryItemType.connection_type, null: false, description: "Inventory status" do
      argument :store_name, [String], required: false, description: "Filter by store name"
      argument :shoe_model, [String], required: false, description: "Filter by shoe model"
    end

    field :ping, String, null: false, description: "Always returns pong."

    def ping
      "pong"
    end

    def stores(name: nil)
      return Store.where(name: name) if name

      Store.all
    end

    def shoes(model: nil)
      return Shoe.where(model: model) if model

      Shoe.all
    end

    def inventory_items(store_name: nil, shoe_model: nil)
      inventory_items = InventoryItem.all
      inventory_items = inventory_items.joins(:store).where(store: { name: store_name }) if store_name
      inventory_items = inventory_items.joins(:shoe).where(shoe: { model: shoe_model }) if shoe_model
      inventory_items
    end
  end
end
