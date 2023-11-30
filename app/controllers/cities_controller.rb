class CitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_country
  before_action :set_city, only: %i[edit update destroy]

  def index
    @cities = @country.cities
    @city = City.new
  end

  def create
    @city = @country.cities.build(city_params)
    @city.user = current_user

    if @city.save
      redirect_to country_cities_path(@country), notice: 'City was successfully created.'
    else
      flash.now[:alert] = @city.errors.full_messages.to_sentence
      render :new
    end
  end


  def edit
    @city = City.find(params[:id])
  end

  def update
    if @city.update(city_params)
      redirect_to country_cities_path(@country), notice: 'City was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @city.destroy
      redirect_to country_cities_path(@country), notice: 'City was successfully deleted.'
    else
      redirect_to country_cities_path(@country), alert: 'City could not be deleted.'
    end
  end

  private

  def set_country
    @country = Country.find(params[:country_id])
  end

  def set_city
    @city = current_user.cities.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:title, :description, :image)
  end
end


