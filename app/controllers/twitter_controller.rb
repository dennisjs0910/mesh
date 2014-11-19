class TwitterController < ApplicationController
  def index
    @twitter_user = TwitterUser.new(current_user)
    @timeline = @twitter_user.get_timeline
  end


  def create
    @twitter_user = TwitterUser.new(current_user)
    @tweet = @twitter_user.tweet(params[:message])
    redirect_to twitter_path
  end
end
