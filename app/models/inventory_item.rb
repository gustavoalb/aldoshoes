# frozen_string_literal: true

class InventoryItem < ApplicationRecord
  belongs_to :store
  belongs_to :shoe
end
