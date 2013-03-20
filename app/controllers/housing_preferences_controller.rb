class HousingPreferencesController < ApplicationController
  def new
    @housing_preference = HousingPreference.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # add private: correct/signed_in_user to bottom. or maybe in applicationcontroller, since it's repeating?
end