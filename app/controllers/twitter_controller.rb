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

  def search
    @twitter_user = TwitterUser.new(current_user)
    @tweet = @twitter_user.search_tweets(params[:search])
  end
end
