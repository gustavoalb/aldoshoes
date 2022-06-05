class Shoe < ApplicationRecord
    has_many :inventory_items
    has_many :stores, through: :inventory_items
    
    validates_uniqueness_of :model
end
