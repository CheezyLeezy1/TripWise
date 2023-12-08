# frozen_string_literal: true

# app/presenters/form_presenter.rb
class FormPresenter
  def initialize(object, view)
    @object = object
    @view = view
  end

  def render_form
    case @object
    when Country
      render_country_form
    when City
      render_city_form
    when Activity
      render_activity_form
    else
      raise ArgumentError, "Unsupported Model: #{@object.class}"
    end
  end

  private

  def render_country_form
    # Logic for rendering the Country form
    @view.render(partial: 'components/country-form', locals: { country: @object })
  end

  def render_city_form
    # Logic for rendering the City form
    @view.render(partial: 'components/city-form', locals: { city: @object })
  end

  def render_activity_form
    # Logic for rendering the Activity form
    @view.render(partial: 'components/activity-form', locals: { activity: @object })
  end
end

