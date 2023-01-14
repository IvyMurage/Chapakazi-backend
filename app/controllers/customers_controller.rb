class CustomersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  skip_before_action :authorized, only: [:create]

  def create
    @customer = Customer.create!(customer_params)
    @token = encode_token(customer_id: @customer.id)
    render json: { customer: CustomerSerializer.new(@customer), jwt: @token }, status: :accepted
  end

  def show
    customer = find_customer
    render json: customer, status: :ok
  end

  def index
    customers = Customer.all
    render json: customers, status: :ok
  end

  def destroy
    customer = find_customer
    customer.destroy
    head :no_content
  end

  def update
    customer = find_customer
    customer.update!(customer_params)
    render json: customer, status: :accepted
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

  def find_customer
    Customer.find(params[:id])
  end

  def render_not_found_response
    render json: { errors: ["Customer not found"] }, status: :not_found
  end
end
