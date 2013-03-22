class HousingPreferencesController < ApplicationController
  
  before_filter :signed_in_user
  before_filter :correct_user, only: [:edit, :update]

  def new
    @user = current_user
    @housing_preference = HousingPreference.new
  end

  def create
    @housing_preference = current_user.housing_preferences.build params[:housing_preference]
    if @housing_preference.save
      flash[:success] = "Preference added."
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @housing_preference = HousingPreference.find params[:id]
    if @housing_preference.update_attributes params[:housing_preference]
      flash[:success] = "Housing preference updated!"
      sign_in current_user
      redirect_to current_user
    else
      flash.now[:error] = "Couldn't save."
      render 'edit'
    end
  end

  def destroy
    @housing_preference = HousingPreference.find params[:id]
    @housing_preference.destroy
    redirect_to current_user
  end

  def dynamic_neighborhoods
    @neighborhoods = City.find(params[:id]).neighborhoods

    respond_to do |format|
      format.js
    end
  end

  private

    def signed_in_user
      store_location
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @housing_preference = current_user.housing_preferences.find params[:id]
      redirect_to root_url if @housing_preference.nil?
    end
end