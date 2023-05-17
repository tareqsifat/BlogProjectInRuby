
class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
end

class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, status: :ok
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: { message: 'User registered successfully' }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def login
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        token = generate_token(user.id)
        render json: { token: token }, status: :ok
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:username, :email, :password, :password_confirmation)
    end
  
    def generate_token(user_id)
      payload = { user_id: user_id }
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
  end
  
