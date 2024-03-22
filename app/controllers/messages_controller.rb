# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: %i[show destroy]

  def index
    @messages = current_user.received_messages.order(created_at: :desc)
  end

  def show
    @reply = @message.replies.build
  end

  def create
    @message = current_user.sent_messages.build(message_params)
    @message.parent_message_id = params[:parent_message_id]

    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  def create_reply
    # binding.pry

    @message = Message.find(params[:message_id])
    @reply = @message.replies.build(reply_params.merge(sender_id: current_user.id, receiver_id: @message.sender_id))
    if @reply.save
      redirect_to message_path(@message)
    else
      render :show
    end
  end

  def destroy
    @message = current_user.received_messages.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :receiver_id)
  end

  def reply_params
    params.require(:message).permit(:content)
  end
end
