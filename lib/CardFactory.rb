# frozen_string_literal: true

require 'activity_card'
require 'city_card'
require 'country_card'

class CardFactory
  def self.create_card(item)
    case item
    when Country
      CountryCard.new(item)
    when City
      CityCard.new(item)
    when Activity
      ActivityCard.new(item)
    else
      raise ArgumentError, "Unsupported item type: #{item.class}"
    end
  end
end
