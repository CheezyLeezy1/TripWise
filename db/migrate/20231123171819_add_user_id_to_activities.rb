class AddUserIdToActivities < ActiveRecord::Migration[7.0]
  def change
    add_reference :activities, :user, foreign_key: true, null: true # Remove the NOT NULL constraint
  end
end
