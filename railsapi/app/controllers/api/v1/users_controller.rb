class Api::V1::UsersController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  ### Get User
  def show
    respond_with User.find(params[:id])
  end

  ### Create new user
  def create
    user = User.create(user_params)
    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors}, status: 422
    end
  end

  #### Update user
  def update
    user = User.find(params[:id])
    if user.update(user_parames)
      render json: user, status: 200
    else
      render json: { errors: user.errors}, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  ### validate parameters
  private
  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation)
  end
end
