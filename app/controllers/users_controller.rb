class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @housing_preferences = @user.housing_preferences
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].except(:carrier_id))
    @user.carrier = Carrier.find params[:user][:carrier_id] unless params[:user][:carrier_id].blank?
    if @user.save
      sign_in @user
      flash[:success] = "You're signed up!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user].except(:carrier_id))
      @user.carrier = Carrier.find params[:user][:carrier_id] unless params[:user][:carrier_id].blank?
      flash[:success] = "Profile updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      store_location
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
