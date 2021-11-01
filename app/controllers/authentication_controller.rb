class AuthenticationController < ApplicationController
  skip_before_action :authorized, only: [:login]

  def login
      @user = User.find_by(username: params[:username])
      if @user&.authenticate(params[:password])
        if !@user.online

          @payload = { user_id: @user.id }
          @token = encode_token(@payload) #payload, app_secret , algo
          #token =  # jwt string:
          render json: {
                   user: UserSerializer.new(@user),
                   token: @token,
                 }, status: :accepted
          else 
            render json: { errors: "User is already connected" }, status: :unauthorized
        end
      else
        render json: { errors: "Invalid username or password" }, status: :unauthorized
      end
   
  end
end
