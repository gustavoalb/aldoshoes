# frozen_string_literal: true

class UpdateInventory
  extend ActiveModel::Callbacks

  attr_reader :item, :store, :shoe, :errors, :message

  define_model_callbacks :call, only: [:before]

  before_call :parse_message, :find_or_create_store, :find_or_create_shoe


  def initialize(data)
    @message = data
  end

  def call
    run_callbacks :call do
      @inventory_item = @store.inventory_items.find_or_initialize_by(shoe_id: @shoe.id)
      Rails.logger.info "Updating #{@store.name} inventory - #{@shoe.model} - available stock: #{@item.inventory}"
      @inventory_item.available_stock = @item.inventory
      @inventory_item.save
      @errors = @inventory_item.errors.full_messages

      return true unless @errors.any?

      Rails.logger.error "Inventory update failure - #{@errors.to_sentence}"
      false
    end
  end

  private

  def parse_message
    @item = begin
      json = JSON.parse(message)
      OpenStruct.new(json)
    rescue JSON::ParserError => e
      Rails.logger.error "Invalid JSON"
      throw :abort
    end
  end

  def find_or_create_store
    @store = Store.find_or_create_by(name: item.store)
  end

  def find_or_create_shoe
    @shoe = Shoe.find_or_create_by(model: item.model)
  end
end
