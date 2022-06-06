# frozen_string_literal: true

class Store < ApplicationRecord
  has_many :inventory_items, dependent: :destroy
  has_many :shoes, through: :inventory_items

  validates :name, uniqueness: true
end
