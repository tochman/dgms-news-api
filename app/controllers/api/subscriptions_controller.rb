class Api::SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user][:id])
    user.subscribed = true
    user.save

    render json: { message: 'You are now subscribed.' }, status: 201
  end
end
