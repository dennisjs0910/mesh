class TwitterUser
  attr_reader :user
  
  def initialize(user)
    @user = user
    create_twitter_client
  end

  def create_twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'F24Pacf6CN7o1gH9E4turYnDz'
      config.consumer_secret     = 'LoFVLjRIpKMdmq0hmoeslLSEgV8qCqdrZi6SvZdJH6lnUvIV9c'
      config.access_token        = user.twitter_authentication.token
      config.access_token_secret = user.twitter_authentication.secret
    end
  end

  def tweet(message)
    @client.update(message)
  end

  def retweet(id)
    @client.retweet(id)
  end 

  def search_tweets(search_params)
    if search_params
      @client.search("to: " + search_params, result_type: "recent").take(10).collect do |tweet| 
        tweet
      end
    else
      nil
    end
  end

  def twitter_username
    @client.current_user.screen_name
  end 

  def get_timeline
    @client.user_timeline(twitter_username)
  end

  def get_home_timeline
    @client.home_timeline
  end


  private
  def twitter_cache_key(user)
    "twitter_#{user.twitter_authentication.uid}"
  end

  def tweets_are_cached?(user)
    Rails.cache.exist?(twitter_cache_key(user))
  end
end