class Api::V1::CreatorsController < ApplicationController
  #before_action :authenticate_developer

  def index
    creators = Creator.limit(@limit).offset(@offset)
    render json: creators, status: :ok
  end

  def create
    creator = Creator.new(creator_params)
    if creator.save
      render json: creator, status: :created
    else
      render json: creator.errors, status: :unprocessable_entity
    end
  end

  private

  def creator_params
    params.require(:creator).permit(:firstName, :lastName, :username, :password)
  end
end
