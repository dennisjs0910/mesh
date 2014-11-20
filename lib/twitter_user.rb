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
      config.access_token        = user.authentications.find_by(provider: 'twitter').token
      config.access_token_secret = user.authentications.find_by(provider: 'twitter').secret
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
    # key = twitter_cache_key(user)
    # if tweets_are_cached?(user)
    #   puts "! Reading tweets from cache"
    #   tweets = JSON.parse(Rails.cache.read(key))
    # else
      # Read all the tweets and store them in the cache.
      # puts "! Writing tweets to cache"
     @client.user_timeline(twitter_username)
      # Rails.cache.write(key, tweets.to_json)
    # end   
    # return tweets
  end

  # def retweet(*args)
  #   post_retweet(id)
  # end

  # def retweet(id, options={})
  #   new_status = post("/1/statuses/retweet/#{id}.json", options)
  #   orig_status = new_status.delete('retweeted_status')
  #   orig_status['retweeted_status'] = new_status
  #   Twitter::Status.new(orig_status)
  # end

  private
  def twitter_cache_key(user)
    "twitter_#{user.twitter_authentication.uid}"
  end

  def tweets_are_cached?(user)
    Rails.cache.exist?(twitter_cache_key(user))
  end
end