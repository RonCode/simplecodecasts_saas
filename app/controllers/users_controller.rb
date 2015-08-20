class UsersController < ApplicationController
  before_action :authenticate_user! #stops users who aren't signed in from viewing profiles
  
  def index
    @users = User.all #grabs all registered users
  end
  
  def show
    @user = User.find(params[:id])
  end
end