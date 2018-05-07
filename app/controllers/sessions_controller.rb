# require 'httparty'                                                             
# require 'json' 
 
class SessionsController < ApplicationController
  
  # include HTTParty
  
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.valid_password?(params[:password])
      render json: @user.as_json(only: [:id,:email]), status: :created
    end 
  end
  
  def new_user_registration
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save
      @user.reload
      render json: @user.as_json(only: [:id,:email]), status: :created
    else
      render json: {"error" => @user.errors.full_messages.uniq.join(', ')}.as_json
    end 
  end
  
  # def get_authorization
    # url = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{params["id_token"]}"                  
    # response = HTTParty.get(url)                   
    # @user = User.create_user_for_google(response.parsed_response)      
    # @user.save
    # render json: @user.as_json
  # end
  
end
