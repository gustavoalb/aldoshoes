# frozen_string_literal: true

module Types
  class InventoryItemType < Types::BaseObject
    field :store, Types::StoreType, null: false
    field :shoe,  Types::ShoeType, null: false
    field :available_stock, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
