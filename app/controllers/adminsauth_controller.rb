class AdminsauthController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  skip_before_action only: [:create]

  def create
    @admin = Admin.find_by(username: admin_params[:username])
    if @admin && @admin.authenticate(admin_params[:password])
      @token = encode_token(admin_id: @admin.id)
      render json: { admin: AdminSerializer.new(@admin), jwt: @token }, status: :created
    end
  end

  private

  def admin_params
    params.permit(:username, :password)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_found_response
    render json: { errors: ["Admin Not Found"] }, status: :not_found
  end
end
