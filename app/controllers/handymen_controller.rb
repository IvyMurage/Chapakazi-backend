class HandymenController < ApplicationController
  skip_before_action :authorized, only: [:create]
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def create
    # byebug
    @handyman = Handyman.create!(handyman_params)
    @token = encode_token(handyman_id: @handyman.id)
    render json: { handyman: HandymanSerializer.new(@handyman), jwt: @token }, status: :created
  end

  def index
    handymen = Handyman.all
    render json: handymen, status: :ok
  end

  def show
    handyman = find_handyman
    render json: handyman, status: :ok
  end

  def update
  end

  def destroy
    handyman = find_handyman
    handyman.destroy
    head :no_content
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
                  :email,
                  :rating,
                  :speciality)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def find_handyman
    Handyman.find(params[:id])
  end

  def render_not_found_response
    render json: { errors: ["Handyman not found"] }
  end
end
