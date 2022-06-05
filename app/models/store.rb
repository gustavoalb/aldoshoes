class Store < ApplicationRecord
    has_many :inventory_items
    has_many :shoes, through: :inventory_items

    validates_uniqueness_of :name
end
