class MessagesController < ApplicationController
  def index
  end

  def create
    puts params
    ActionCable.server.broadcast 'message:message_channel', { content: params[:text] }
  end
end
