# app/controllers/api/v1/users_controller.rb

module Api::V1
  class UsersController < ApiController

    swagger_controller :users, "User Management"

    # GET /api/v1/users
    swagger_api :index do
      summary "Fetches all User items"
      notes "This lists all users"
      response :ok, "Success", :User
      response :unauthorized
      response :not_acceptable, "The request you made is not acceptable"
      response :requested_range_not_satisfiable
    end
    # GET /api/v1/users
    def index
      render json: User.all
    end

  end
end
