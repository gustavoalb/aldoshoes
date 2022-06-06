# frozen_string_literal: true

class UpdateInventoryJob < ApplicationJob
  queue_as :default

  def perform(data)
    UpdateInventory.new(data).call
  end
end
