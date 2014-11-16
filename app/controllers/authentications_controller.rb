class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
    @twitter = twitter_timeline
  end

  def create
    auth = request.env["omniauth.auth"]
    current_user.find_or_create_authentication(auth['provider'], auth['uid'], auth['credentials']['token'], auth['credentials']['secret'])   
      
    flash[:notice] = "AIYO IT WORKS"
    twitter
    redirect_to authentications_url
  end

  def twitter
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'F24Pacf6CN7o1gH9E4turYnDz'
      config.consumer_secret     = 'LoFVLjRIpKMdmq0hmoeslLSEgV8qCqdrZi6SvZdJH6lnUvIV9c'
      config.access_token        = current_user.authentications.find_by(provider: 'twitter').token
      config.access_token_secret = current_user.authentications.find_by(provider: 'twitter').secret
    end
  end 

  def twitter_timeline
    twitter.home_timeline.each do |tweet|
      return tweet.attrs
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end

end