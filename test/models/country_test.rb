# frozen_string_literal: true

require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  def setup
    @usa = countries(:usa)
    @france = countries(:france)
    @japan = countries(:japan)
  end

  test 'valid country' do
    assert @usa.valid?
    assert @france.valid?
    assert @japan.valid?
  end

  test 'invalid without title' do
    @usa.title = nil
    refute @usa.valid?
    assert_not_nil @usa.errors[:title]
  end

  test 'invalid without description' do
    @france.description = nil
    refute @france.valid?
    assert_not_nil @france.errors[:description]
  end

  test 'association with user' do
    assert_equal users(:john_doe), @usa.user
    assert_equal users(:john_doe), @france.user
    assert_equal users(:john_doe), @japan.user
  end
end
