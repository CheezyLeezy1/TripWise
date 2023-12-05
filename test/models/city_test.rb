# frozen_string_literal: true

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  def setup
    @user = users(:john_doe)
    @country = countries(:usa)
    @valid_city = cities(:valid_city)
    @invalid_city = cities(:invalid_city)
  end

  test 'valid city' do
    assert @valid_city.valid?
  end

  test 'invalid city without title' do
    @invalid_city.title = ''
    assert_not @invalid_city.valid?
  end

  test 'invalid city without description' do
    @invalid_city.description = ''
    assert_not @invalid_city.valid?
  end

  test 'city should belong to a user' do
    assert_equal @valid_city.user, @user
  end

  test 'city should belong to a country' do
    assert_equal @valid_city.country, @country
  end

  test 'city title should be unique within the same country' do
    duplicate_city = @country.cities.build(title: @valid_city.title, description: 'Another city')
    assert_not duplicate_city.valid?
  end

  test 'city title should not be case-sensitive within the same country' do
    duplicate_city = @country.cities.build(title: @valid_city.title.downcase, description: 'Another city')
    assert_not duplicate_city.valid?
  end
end
