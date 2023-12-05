# frozen_string_literal: true

# Comment
class AddUserIdToCountries < ActiveRecord::Migration[7.0]
  def change
    add_reference :countries, :user, null: false, foreign_key: true
  end
end
