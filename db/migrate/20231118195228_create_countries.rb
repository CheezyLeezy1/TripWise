# frozen_string_literal: true

# Comment
class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
