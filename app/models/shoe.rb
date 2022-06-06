# frozen_string_literal: true

class Shoe < ApplicationRecord
  has_many :inventory_items, dependent: :destroy
  has_many :stores, through: :inventory_items

  validates :model, uniqueness: true
end
