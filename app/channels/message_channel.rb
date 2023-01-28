class MessageChannel < ApplicationCable::Channel
  def subscribed
    puts 'subscribed from channel'
    puts params

    channel_id = "message_channel_#{params[:session_id]}"
    puts channel_id

    stream_for channel_id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def pitch(data)
    puts 'pitch action'
    puts data

    channel_id = "message:message_channel_#{data['session_id']}"
    puts channel_id
    ActionCable.server.broadcast(channel_id, { content: data['text'] })
  end
end
