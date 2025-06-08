class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @playlists = @user.playlists.includes(:tracks)
    @devices = @user.devices
    @subscriptions = @user.subscriptions
  end

  def index
    @users = User.all
  end
end
