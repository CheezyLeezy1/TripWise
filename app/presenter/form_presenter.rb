# frozen_string_literal: true

# app/presenters/form_presenter.rb
class FormPresenter
  def initialize(options, view)
    @options = options
    @view = view
  end

  def render_form
    if @options.key?(:activity)
      render_activity_form
    elsif @options.key?(:city) && @options.key?(:country)
      render_city_form_with_country
    elsif @options.key?(:country)
      render_country_form
    else
      raise ArgumentError, "Unsupported options: #{@options}"
    end
  end

  private

  def render_activity_form
    # Logic for rendering the Activity form
    @view.render(partial: 'components/activity-form', locals: { city: @options[:city], activity: @options[:activity] })
  end

  def render_city_form_with_country
    # Logic for rendering the City form with Country
    @view.render(partial: 'components/city-form', locals: { country: @options[:country], city: @options[:city] })
  end

  def render_country_form
    # Logic for rendering the Country form
    @view.render(partial: 'components/country-form')
  end
end


