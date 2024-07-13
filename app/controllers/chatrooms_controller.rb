class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatrooms = Chatroom.joins(:messages).where(messages: { user_id: current_user.id }).distinct
    @chatroom = @chatrooms.first
    @message = Message.new if @chatroom
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    respond_to do |format|
      format.html # show.html.erb
      format.js { render partial: 'chatrooms/chatroom' }
    end
  end
end
