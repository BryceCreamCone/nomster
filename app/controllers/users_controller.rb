class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_places = Place.where("user_id = ?", @user).page(params[:page]).per(5)
  end
end
