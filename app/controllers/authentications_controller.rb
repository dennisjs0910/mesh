require 'pry'

class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
    twitter
  end

  def create
    auth = request.env["omniauth.auth"]
    # if user already has an authentication for this provider
      # update the uid with the latest token
    # if the user doesn't have an authentication for the provider
      # create an authentication with the provider and uid
    current_user.find_or_create_authentication(auth['provider'], auth['uid'], auth['credentials']['token'], auth['credentials']['secret'])   
       
    # current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
    flash[:notice] = "AIYO IT WORKS"
    twitter
    # @client = Twitter::REST::Client.new do |config|
    #   binding.pry
    #   config.consumer_key        = 'F24Pacf6CN7o1gH9E4turYnDz'
    #   config.consumer_secret     = 'LoFVLjRIpKMdmq0hmoeslLSEgV8qCqdrZi6SvZdJH6lnUvIV9c'
    #   config.access_token        = current_user.authentications.find_by(provider: 'twitter').token
    #   config.access_token_secret = current_user.authentications.find_by(provider: 'twitter').secret

    # end
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

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end

  # def show
  #   @oauth ||= Twitter::OAuth.new(AppConfig['consumer']['token'], AppConfig['consumer']['secret'])
  #   @oauth.authorize_from_request(session['rtoken'], session['rsecret'], params[:oauth_verifier])

  #   session['rtoken'] = nil
  #   session['rsecret'] = nil
  #   session['atoken'] = @oauth.access_token.token
  #   session['asecret'] = @oauth.access_token.secret
  #   redirect_path = session['admin'] ? admin_tweets_path : root_path
  #   redirect_to redirect_path
  # end
end