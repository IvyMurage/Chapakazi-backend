class JobHandymenController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def create
    jobhandyman = JobHandyman.create!(job_handyman_params)
    render json: jobhandyman, status: :accepted
  end

  def update
    jobhandyman = find_job_handyman
    jobhandyman.update!(job_handyman_params)
    render json: jobhandyman, status: :accepted
  end

  def destroy
    jobhandyman = find_job_handyman
    jobhandyman.destroy
    render json: { status: ["rejected"] }, status: :ok
  end

  def index
    jobhandymen = JobHandyman.all
    render json: jobhandymen, status: :ok
  end

  def job_handyman_params
    params.permit(:job_id, :handyman_id, :status)
  end

  def find_job_handyman
    JobHandyman.find(params[:id])
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_found_response
    render json: { errors: ["JobHandyman not found"] }, status: :not_found
  end
end
