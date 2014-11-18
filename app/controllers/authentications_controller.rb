require 'pry'

class AuthenticationsController < ApplicationController

  before_action :require_user, only: [:index]

  def index
    @authentications = current_user.authentications
    twitter_user = TwitterUser.new(current_user)
    @tweets = twitter_user.get_timeline
    # instagram_user = InstagramUser.new(current_user)
    client = Instagram.client(:access_token => current_user.authentications.find_by(provider: "instagram").token)
    binding.pry
    @instas = client.media_popular
    # @instas = client.media_popular
  end

  def create
    auth = request.env["omniauth.auth"]
      #twitter
    if auth['credentials']['secret']
      current_user.find_or_create_authentication(auth['provider'], auth['uid'], auth['credentials']['token'], auth['credentials']['secret']) 
    else
      #instagram
      current_user.find_or_create_authentication(auth['provider'], auth['uid'], auth['credentials']['token'], "empty")
    end 
      
    flash[:notice] = "AIYO IT WORKS"
    redirect_to authentications_url
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end

private
  # NOTE: All this should go in the library




  # def display_url
  #   array = []
  #   twitter.home_timeline.each do |tweet|
  #     return tweet.attrs[:extended_entities][:media][0][:display_url]
  #   end
  # end


  # def twitter_timeline
  #   twitter.user_timeline("OctoberMeshmesh")

  # end


end