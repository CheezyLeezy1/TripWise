# frozen_string_literal: true

require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @user = users(:john_doe)
    sign_in @user
  end

  test 'should get show' do
    get :show
    assert_response :success
    assert_template :show
  end

  test 'should create country' do
    assert_difference('Country.count') do
      post :create, params: { country: { title: 'New Country', description: 'Description' } }
    end

    assert_redirected_to countries_path
    assert_equal 'Country was successfully created.', flash[:notice]
  end

  test 'should not create country with invalid params' do
    assert_no_difference('Country.count') do
      post :create, params: { country: { title: nil, description: 'Description' } }
    end

    assert_redirected_to countries_path
    assert_equal 'Country could not be created.', flash[:alert]
  end

  test 'should get edit' do
    country = countries(:france)
    get :edit, params: { id: country.id }
    assert_response :success
    assert_template :edit
  end

  test 'should update country' do
    country = countries(:france)
    patch :update, params: { id: country.id, country: { title: 'Updated Country' } }
    assert_redirected_to countries_path
    country.reload
    assert country.title.eql? 'Updated Country'
  end

  test 'should not update country with invalid params' do
    country = countries(:france)
    patch :update, params: { id: country.id, country: { title: nil } }
    assert_template :edit
  end

  test 'should destroy country' do
    country = countries(:france)
    assert_difference('Country.count', -1) do
      delete :destroy, params: { id: country.id }
    end

    assert_redirected_to countries_path
  end
end
