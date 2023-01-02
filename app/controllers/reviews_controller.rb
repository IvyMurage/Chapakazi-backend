class ReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_review_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
    if params[:handyman_id]
      reviews = Review.find(params[:handyman_id])
    else
      reviews = Review.all
    end
    render json: reviews.order(:created_at), status: :ok
  end

  def show
    review = Review.find(params[:id])
    render json: review, status: :ok
  end

  def create
    review = Review.create!(review_params)
    render json: review, status: :created
  end

  def update
    review = Review.update!(review_params)
    render json: review, status: :accepted
  end

  def destroy
    review = find_review
    review.destroy
    head :no_content
  end

  private

  def find_review
    Review.find(params[:id])
  end

  def review_params
    params.permit(:handyman_id, :comment, :customer_id)
  end

  def render_review_not_found_response
    render json: { errors: ["Review not found"] }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
