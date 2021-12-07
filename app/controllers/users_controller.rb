class UsersController < ApplicationController
    skip_before_action :authorized, only: [:signup , :profile]
    def index
      @users = User.all
      render json: UserSerializer.new(@users)
    end
  
    def signup
      # signup
      @user = User.new(user_params)
      if @user.save
        @user.appear
        payload = { user_id: @user.id }
        @token = encode_token(payload)  #payload, app_secret , algo
        #token =  # jwt string:
        
        render json: {
                 user: UserSerializer.new(@user),
                 token: @token,
               }, status: :created
      else
        render json: { message: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def profile 
      if logged_in?
        render json: { user: current_user }, status: :ok
      else
        render json: { message: ["Not Logged In"]}, status: :ok
      end
    end
   
  
  
    private
  
    def user_params
      params.permit(:username, :password)
    end
  end
  