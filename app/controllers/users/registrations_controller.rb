class Users::RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: user, serializer: CurrentUserSerializer, status: 201
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  private

    def user_params
      params.permit(:username, :email, :password)
    end
end
