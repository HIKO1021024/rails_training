class ArticleChannel < ApplicationCable::Channel
  def subscribed
    stream_from "article_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast 'article_channel', message: data['message']
  end
end
