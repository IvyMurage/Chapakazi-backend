class CustomersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    @customer = Customer.create!(customer_params)
    @token = encode_token(customer_id: @customer.id)
    render json: { customer: CustomerSerializer.new(@customer), jwt: @token }, status: :accepted
  end

  private

  def customer_params
    params.permit(:username,
                  :image,
                  :password,
                  :password_confirmation,
                  :location,
                  :description,
                  :admin_id)
  end
end
