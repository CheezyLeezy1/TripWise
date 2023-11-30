# frozen_string_literal: true

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def setup
    @city = City.create(title: 'Test City', description: 'A test city')
    @activity = Activity.new(title: 'Test Activity', description: 'A test activity', city: @city)
  end

  test 'should be valid with valid attributes' do
    assert @activity.valid?
  end

  test 'should be invalid without a title' do
    @activity.title = ''
    assert_not @activity.valid?
  end

  test 'should be invalid without a description' do
    @activity.description = ''
    assert_not @activity.valid?
  end

  test 'should belong to a city' do
    assert_equal @activity.city, @city
  end

  test 'should have an attached image' do
    assert @activity.image.attach(io: File.open(Rails.root.join('test/fixtures/files/sample.jpg')), filename: 'sample.jpg', content_type: 'image/jpeg')
  end

  test 'should be able to access attached image' do
    image_path = Rails.root.join('test/fixtures/files/sample.jpg')
    @activity.image.attach(io: File.open(image_path), filename: 'sample.jpg', content_type: 'image/jpeg')
    assert_equal @activity.image.download, File.binread(image_path)
  end

  test 'should be able to detach an image' do
    @activity.image.attach(io: File.open(Rails.root.join('test/fixtures/files/sample.jpg')), filename: 'sample.jpg', content_type: 'image/jpeg')
    @activity.image.purge
    assert_not @activity.image.attached?
  end

  test 'should not allow an Activity without a City' do
    activity = Activity.new(title: 'Test Activity', description: 'A test activity')
    assert_not activity.valid?
  end
end

