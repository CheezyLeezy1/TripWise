# frozen_string_literal: true


class CountryCard
  def initialize(country)
    @country = country
  end

  def render
    render_country_card_html
  end

  private

  def render_country_card_html
    html = <<-HTML
      <div class="flex-1 min-w-full sm:min-w-0 sm:w-1/2 lg:w-1/3 bg-white border border-gray-200 rounded-lg shadow-md overflow-hidden dark:bg-gray-800 dark:border-gray-700">
        <div class="image-container">
          <%= image_tag(@country.image, class: 'responsive-image', alt: @country.title) if @country.image.attached? %>
        </div>
        <div class="p-5">
          <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white max-w-md"><%= @country.title %></h5>
          <p class="font-normal text-gray-700 dark:text-gray-400 max-w-md"><%= @country.description %></p>
          <div class="mt-4 mx-auto flex justify-between">
            <%= link_to 'Edit', edit_country_path(@country), class: 'text-white bg-gradient-to-br from-pink-500 to-orange-400 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-pink-200 dark:focus:ring-pink-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center' %>
            <%= link_to "Delete", country_path(@country), class: 'text-white bg-gradient-to-br from-pink-500 to-orange-400 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-pink-200 dark:focus:ring-pink-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center', data: { turbo_method: :delete, turbo_confirm: "Are you sure you want to delete #{@country.title}?" } %>
          </div>
        </div>
      </div>
    HTML
    html.html_safe
  end
end

