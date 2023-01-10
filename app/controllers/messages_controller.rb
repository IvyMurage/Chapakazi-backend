class MessagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_message_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  skip_before_action :authorized, only: [:index]

  #GET
    def index 
    if params[:customer_id], params[:handyman_id]
    messages = Message.find(params[:customer_id], params[:handyman_id])
    else
        messages = Message.all
        render json: messages
    end

    def show
    #     message =  Message.find(params[:customer_id], params[:handymen_id])
    #     if message
    #         render json: message
    #     else
    #         render json:{ error: "message not found"}, status: :not_found
    # end
    message = Message.find(params[:id])
    render json: message, status: :ok
end

#POST
def create 
    if params[:customer_id], params[:handyman_id]
    message = Message.create!(message_params)
    render json:message, status: :created
end


#PUT/UPDATE
def update 
    message = Message.update!(message_params)
    render json: message, status: :accepted
end

#DELETE
def destroy
    message = find_message
    message.destroy
    head :no_content
end

private
  def message_params
    params.permit(:customer_id, :handyman_id, :message )
  end 

  def find_message
    Message.find(params[:id])
   end

  def render_message_not_found_response
    render json: { errors: ["Message not found"] }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
  
end