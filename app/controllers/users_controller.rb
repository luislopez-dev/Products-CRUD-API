class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    render json: @user
  end

  def update
    @user = User.find(params[:id])

  end

  def destroy
    @users = User.all
    @user = User.find(params[:id])
    @user.destroy
    render json: @users
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
