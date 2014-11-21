class TwitterController < ApplicationController
  before_action :twitter_user

  def index
    @timeline = twitter_user.get_timeline
  end

  def create
    @tweet = twitter_user.tweet(params[:message])
    redirect_to twitter_index_path
  end

  def re_tweet
    @retweet = twitter_user.retweet(params[:id])
    redirect_to twitter_index_path
  end 

  def home
    twitter_user.get_home_timeline
  end

  def search
    @tweet = twitter_user.search_tweets(params[:search])
  end

end
