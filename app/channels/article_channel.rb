class ArticleChannel < ApplicationCable::Channel
  def subscribed
    stream_from "article_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)

    @user = User.find_by(randomkey:data['message'][0])
    Rails.logger.debug(@user)
    if  @user.nil? 
      data['message'] = "ユーザーは存在しない"
    else
      data['message'][3] = @user.name
      data['message'][2] = @user.image.url
      @article = Article.new(content:data['message'][1],user_id:@user.id)
      @article.save
    end
    
    
     
    ActionCable.server.broadcast 'article_channel', message: data['message']
    
  end
end
