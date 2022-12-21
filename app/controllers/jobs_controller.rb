class JobsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    jobs = Job.all
    render json: jobs, status: :ok
  end

  def show
    job = find_job
    render json: job, serializer: JobCustomerSerializer, status: :ok
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def find_job
    Job.find(params[:id])
  end

  def render_not_found_response
    render json: { error: ["Job not found"] }, status: :not_found
  end
end
