class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_country
  before_action :set_city
  before_action :set_activity, only: %i[edit update destroy]

  def index
    @activities = @city.activities
    @activity = Activity.new
  end

  def create
    @activity = @city.activities.build(activity_params)
    @activity.user = current_user

    if @activity.save
      redirect_to country_city_path(@country, @city), notice: 'Activity was successfully created.'
    else
      flash.now[:alert] = @activity.errors.full_messages.to_sentence
      render :new
    end
  end


  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    if @activity.update(activity_params)
      redirect_to country_city_path(@country, @city), notice: 'Activity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @activity.destroy
      redirect_to country_city_path(@country, @city), notice: 'Activity was successfully deleted.'
    else
      redirect_to country_city_path(@country, @city), alert: 'Activity could not be deleted.'
    end
  end

  private

  def set_country
    @country = Country.find(params[:country_id])
  end

  def set_city
    @city = @country.cities.find(params[:city_id])
  end

  def set_activity
    @activity = current_user.activities.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :rating, :image)
  end
end


