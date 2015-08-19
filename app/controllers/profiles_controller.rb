class ProfilesController < ApplicationController
  before_action :authenticate_user! #before any action below happens, you must be authenticated and signed up to access pages
  before_action :only_current_user #created method to only allow current user to edit his/her own profile
  
  def new
    # form where a user can fill out their own profile
    @user = User.find(params[:user_id]) #reach into the database and find the user that's loged in
    @profile = Profile.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @profile = @user.build_profile(profile_params) #saves info
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path(params[:user_id])
    else
      render action: :new
    end
  end
  
  def edit
    @user = User.find(params[:user_id])  
    @profile = @user.profile
  end
  
  def update
    @user = User.find(params[:user_id])    
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile Updated!"
      redirect_to user_path(params[:user_id])
    else
      render action: :edit  
    end
  end
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
    
    def only_current_user
      @user = User.find(params[:user_id])
      redirect_to(root_url) unless @user == current_user
    end
end