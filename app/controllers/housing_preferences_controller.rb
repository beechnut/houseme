class HousingPreferencesController < ApplicationController
  def new
    @housing_preference = HousingPreference.new
  end

  def create
    # current_user.housing_preferences.build(@housing_preference)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def dynamic_neighborhoods
    @neighborhoods = City.find(params[:id]).neighborhoods

    respond_to do |format|
      format.js
    end
  end

  # add private: correct/signed_in_user to bottom. or maybe in applicationcontroller, since it's repeating?
end