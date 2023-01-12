class JobsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  # skip_before_action :authorized, only: [:create]

  def index
    jobs = Job.all
    render json: jobs, status: :ok
  end

  def show
    job = find_job
    render json: job, serializer: JobCustomerSerializer, status: :ok
  end

  def create
    job = current_customer.jobs.create!(job_params)
    render json: job, status: :created
  end

  def update
    job = find_job
    job.update!(job_params)
    render json: job, status: :accepted
  end

  def destroy
    job = find_job
    job.destroy
    head :no_content
  end

  private

  def find_job
    Job.find(params[:id])
  end

  def job_params
    params.permit(:title, :description, :budget)
  end

  def render_not_found_response
    render json: { error: ["Job not found"] }, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
