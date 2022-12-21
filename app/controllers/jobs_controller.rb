class JobsController < ApplicationController
  def index
    jobs = Job.all
    render json: jobs, status: :ok
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
