# frozen_string_literal: true

# Comment
class CountriesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_countries, only: %i[show create edit update destroy]

  def show
    @country = Country.new
    puts "@countries count: #{@countries.count}"
  end

  def create
    @country = current_user.countries.build(country_params)
    if @country.save
      redirect_to countries_path, notice: 'Country was successfully created.'
    else
      redirect_to countries_path, alert: 'Country could not be created.'
    end
  end


  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    if @country.update(country_params)
      redirect_to countries_path, notice: 'Country was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    puts 'Destroy action called'
    @country = Country.find(params[:id])
    if @country.destroy
      redirect_to countries_path, notice: 'Country was successfully deleted.'
    else
      redirect_to countries_path, alert: 'Country could not be deleted.'
    end
  end

  private

  def country_params
    params.require(:country).permit(:title, :description, :image)
  end

  def load_countries
    @countries = current_user.countries
  end
end
