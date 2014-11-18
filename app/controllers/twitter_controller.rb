class TwitterController < ApplicationController
  def index
    twitter_user = TwitterUser.new(current_user)
    @tweets = twitter_user.get_timeline
  end
end
