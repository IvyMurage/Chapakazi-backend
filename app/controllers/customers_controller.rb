class CustomersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  skip_before_action :authorized, only: [:create]

  def create
    @customer = Customer.create!(customer_params)
    @token = encode_token(customer_id: @customer.id)
    render json: { customer: CustomerSerializer.new(@customer), jwt: @token }, status: :accepted
  end

  def index
  end

  def destroy
  end

  private

  def customer_params
    params.permit(:username,
                  :image,
                  :password,
                  :password_confirmation,
                  :location,
                  :admin_id)
  end

end
