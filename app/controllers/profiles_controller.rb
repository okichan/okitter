class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update, :destroy]
    def edit
        @profile = Profile.find_or_initialize_by(user: current_user)
    end

    def create
      @profile = Profile.new(profile_params)
      @profile.user = current_user
  
      respond_to do |format|
        if @profile.save
          format.html { redirect_to tweets_path, notice: 'Profile was successfully created.' }
          format.json { render :show, status: :created, location: @profile }
        else
          format.html { render :new }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @profile.update(profile_params) 
          format.html { redirect_to tweets_path, notice: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @profile }
        else
          format.html { render :edit }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end 
    end
    
    private
    def set_profile
      if params[:id]
        @profile = Profile.find_by(user_id: params[:id])
      else
        @profile = Profile.find_by(user: current_user)
      end
    end

    def profile_params
      params.require(:profile).permit(:nickname, :username, :bio)
    end
end
