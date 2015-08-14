class ProfilesController < ApplicationController
   def new
     # form where a user can fill out their own profile
     @user = User.find(params[:user_id]) #reach into the database and find the user that's loged in
     @profile = @user.build_profile
   end
end
