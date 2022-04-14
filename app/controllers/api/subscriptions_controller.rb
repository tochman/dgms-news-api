class Api::SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.update(subscribed: true)

    render json: { message: 'You are now subscribed.' }, status: 201
  end
end
