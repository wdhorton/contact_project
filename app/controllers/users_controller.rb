class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.update(params[:id], user_params)
    if user
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :bad_request
      )
    end
  end

  def destroy
    user = User.destroy(params[:id])
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
