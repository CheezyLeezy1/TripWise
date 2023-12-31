# frozen_string_literal: true

# Comment
class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
