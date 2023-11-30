class AddCountryIdToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :country_id, :integer
  end
end
