class UsersController < ApplicationController
  before_action :authenticate_user! #stops users who aren't signed in from viewing profiles
  
  def show
    @user = User.find(params[:id])
  end
end