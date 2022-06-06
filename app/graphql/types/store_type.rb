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

    def shoes(model: nil)
      return object.shoes.where(model: model) if model

      object.shoes
    end
  end
end
