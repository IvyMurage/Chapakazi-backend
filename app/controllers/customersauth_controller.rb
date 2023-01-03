class CustomersauthController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    @customer = Customer.find_by(username: customer_login_params[:username])
    if @customer && @customer.authenticate(customer_login_params[:password])
      @token = encode_token(customer_id: @customer.id)
      render json: { customer: @customer, jwt: @token }, status: :accepted
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  private

  def customer_login_params
    params.permit(:username, :password)
  end
end
