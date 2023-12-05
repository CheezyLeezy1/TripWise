# frozen_string_literal: true

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def setup
    @valid_activity = activities(:valid_activity)
    @invalid_activity = activities(:invalid_activity)
  end

  test 'valid activity should be valid' do
    assert @valid_activity.valid?
  end

  test 'invalid activity should be invalid' do
    assert_not @invalid_activity.valid?
  end

  test 'activity should belong to a user' do
    assert_equal @valid_activity.user, users(:john_doe) # Assuming you have defined this fixture
  end

  test 'activity should belong to a city' do
    assert_equal @valid_activity.city, cities(:valid_city) # Assuming you have defined this fixture
  end

  test 'activity description should not be blank' do
    @valid_activity.description = ''
    assert_not @valid_activity.valid?
  end

  test 'activity title should not be blank' do
    @valid_activity.title = ''
    assert_not @valid_activity.valid?
  end

  test 'invalid activity should not have an attached image' do
    assert_not @invalid_activity.image.attached?
  end

  test 'invalid activity should not be saved' do
    assert_not @invalid_activity.save
  end
end
