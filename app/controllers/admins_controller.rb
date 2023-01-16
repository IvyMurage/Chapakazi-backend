class AdminsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    @admin = Admin.create!(admin_params)
    @token = encode_token(admin: @admin_id)
    render json: { admin: AdminSerializer.new(@admin), jwt: @token }, status: :created
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def admin_params
    params.permit(:username,
                  :password,
                  :password_confirmation)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }
  end
end
