class TwitterController < ApplicationController
  
  def index
    @twitter_user = TwitterUser.new(current_user)
    @timeline = @twitter_user.get_timeline
  end

  def create
    @twitter_user = TwitterUser.new(current_user)
    @tweet = @twitter_user.tweet(params[:message])
    redirect_to twitter_index_path
  end

  def re_tweet
    @twitter_user = TwitterUser.new(current_user)
    @retweet = @twitter_user.retweet(params[:id])
    redirect_to twitter_index_path
  end 

  def home
    @twitter_user = TwitterUser.new(current_user)
    @twitter_user.get_home_timeline
  end

  def search
    @twitter_user = TwitterUser.new(current_user)
    @tweet = @twitter_user.search_tweets(params[:search])
  end

end
