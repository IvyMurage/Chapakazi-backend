class HandymenController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @handyman = Handyman.create!(handyman_params)
    @token = encode_token(handyman_id: @handyman.id)
    render json: { handyman: HandymanSerializer.new(@handyman), jwt: @token }, status: :created
  end

  private

  def handyman_params
    params.permit(:username,
                  :password,
                  :password_confirmation,
                  :location,
                  :image,
                  :description,
                  :admin_id,
                  :rating,
                  :speciality)
  end
end
