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

    def stores(name: nil)
      return object.stores.where(name: name) if name

      object.stores
    end
  end
end
