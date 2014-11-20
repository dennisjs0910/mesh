class TwitterController < ApplicationController
  def index
    @twitter_user = TwitterUser.new(current_user)
    @timeline = @twitter_user.get_timeline
    @search = @twitter_user.search_tweets(params[:search])
  end


  def create
    @twitter_user = TwitterUser.new(current_user)
    @tweet = @twitter_user.tweet(params[:message])
    redirect_to twitter_path
  end

  def re_tweet
    @twitter_user = TwitterUser.new(current_user)
    binding.pry
    @retweet = @twitter_user.retweet(params[:id])
  end 

  # def search
  #   @twitter_user = TwitterUser.new(current_user)
  #   @tweet = @twitter_user.search(params[:search])
  #   redirect_to twitter_path
  # end

end
