# frozen_string_literal: true

require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @user = users(:john_doe)
    sign_in @user
    @country = countries(:france)
  end

  test 'should get index' do
    get :index, params: { country_id: @country.id }
    assert_response :success
    assert_template :index
  end

  test 'should create city' do
    assert_difference('City.count') do
      post :create, params: { country_id: @country.id, city: { title: 'New City', description: 'Description' } }
    end

    assert_redirected_to country_cities_path(@country)
    assert_equal 'City was successfully created.', flash[:notice]
  end

  test 'should get edit' do
    city = cities(:valid_city)
    get :edit, params: { country_id: @country.id, id: city.id }
    assert_response :success
    assert_template :edit
  end

  test 'should update city' do
    city = cities(:valid_city)
    patch :update, params: { country_id: @country.id, id: city.id, city: { title: 'Updated City' } }
    assert_redirected_to country_cities_path(@country)
    assert_equal 'City was successfully updated.', flash[:notice]

    city.reload
    assert_equal 'Updated City', city.title
  end

  test 'should destroy city' do
    city = cities(:valid_city)
    assert_difference('City.count', -1) do
      delete :destroy, params: { country_id: @country.id, id: city.id }
    end

    assert_redirected_to country_cities_path(@country)
    assert_equal 'City was successfully deleted.', flash[:notice]
  end
end
