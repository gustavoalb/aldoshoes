class CreateInventoryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_items do |t|
      t.references :store, null: false, foreign_key: true
      t.references :shoe, null: false, foreign_key: true
      t.integer :available_stock, default: 0

      t.timestamps
    end
  end
end
