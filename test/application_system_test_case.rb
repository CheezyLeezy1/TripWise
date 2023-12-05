# frozen_string_literal: true
require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  #
  # setup do
  #   @user = users(:john_doe)
  #   @countries = countries(:usa, :france, :japan)
  # end
  #
  # test 'user can see the TripWise homepage' do
  #   visit root_path
  #
  #   assert_selector 'h1', text: 'Your Journeys, Documented with TripWise.'
  #   assert_selector 'p', text: 'Ready to document your incredible journeys?'
  # end
  #
  # test "user can click 'Create' button to show the country form" do
  #   login_as(@user)
  #
  #   visit root_path
  #   click_on 'Create'
  #
  #   assert_selector '#country-form-container', visible: :visible
  # end
  #
  # test 'user can add a new country' do
  #   login_as(@user)
  #
  #   visit root_path
  #   click_on 'Create'
  #
  #   fill_in 'Country Name', with: 'New Country'
  #   fill_in 'Description', with: 'A description of the new country'
  #   click_on 'Save Country'
  #
  #   assert_text 'New Country'
  #   assert_text 'A description of the new country'
  # end
  #
  # test 'user can see a list of countries' do
  #   login_as(@user)
  #
  #   visit root_path
  #
  #   assert_selector '.country-card', count: @countries.count
  #   @countries.each do |country|
  #     assert_text country.title
  #   end
  # end
  #
  # test 'user can click on a country card to view its cities' do
  #   login_as(@user)
  #
  #   visit root_path
  #
  #   first('.country-card-link').click
  #
  #   assert_selector 'h2', text: 'Cities in Country' # Update with actual header text
  #   # Add assertions to verify the city cards or other city-related content
  # end
  #
  # test 'user can close the country form' do
  #   login_as(@user)
  #
  #   visit root_path
  #   click_on 'Create'
  #
  #   click_on 'Close Form'
  #
  #   assert_selector '#country-form-container', visible: :hidden
  # end
end
