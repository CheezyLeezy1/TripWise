# frozen_string_literal: true

# Comment
class AddUserIdToCities < ActiveRecord::Migration[6.0]
  def change
    add_reference :cities, :user, foreign_key: true, null: true # Remove the NOT NULL constraint
  end
end
