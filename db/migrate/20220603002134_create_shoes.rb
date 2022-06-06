# frozen_string_literal: true

class CreateShoes < ActiveRecord::Migration[7.0]
  def change
    create_table :shoes do |t|
      t.string :model

      t.timestamps
    end
  end
end
