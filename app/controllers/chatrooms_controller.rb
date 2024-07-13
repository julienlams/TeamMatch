class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.joins(:messages).where(messages: { user_id: current_user.id }).distinct
  end
end
