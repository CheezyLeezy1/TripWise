# frozen_string_literal: true

require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  fixtures :cities, :users

  setup do
    @user = users(:john_doe)
    sign_in @user
    @city = cities(:valid_city)
  end

  test 'should get index' do
    get :index, params: { country_id: @city.country.id, city_id: @city.id }
    assert_response :success
    assert_template :index
  end

  test 'should create valid activity' do
    assert_difference('Activity.count') do
      post :create, params: {
        country_id: @city.country.id,
        city_id: @city.id,
        activity: {
          title: activities(:valid_activity).title,
          description: activities(:valid_activity).description
        }
      }
    end

    assert_redirected_to country_city_path(@city.country, @city)
    assert_not_nil flash[:notice]
  end


  test 'should get edit' do
    activity = activities(:valid_activity)
    get :edit, params: { country_id: @city.country.id, city_id: @city.id, id: activity.id }
    assert_response :success
    assert_template :edit
  end

  test 'should update activity' do
    activity = activities(:valid_activity)
    patch :update, params: {
      country_id: @city.country.id,
      city_id: @city.id,
      id: activity.id,
      activity: { title: 'Updated Activity' }
    }
    assert_redirected_to country_city_path(@city.country, @city)
    assert_not_nil flash[:notice]

    activity.reload
    assert_equal 'Updated Activity', activity.title
  end

  test 'should destroy activity' do
    activity = activities(:valid_activity)
    assert_difference('Activity.count', -1) do
      delete :destroy, params: {
        country_id: @city.country.id,
        city_id: @city.id,
        id: activity.id
      }
    end

    assert_redirected_to country_city_path(@city.country, @city)
    assert_not_nil flash[:notice]
  end
end



