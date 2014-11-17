require 'pry'

class AuthenticationsController < ApplicationController

  before_action :require_user, only: [:index]

  def index
    @authentications = current_user.authentications
    twitter_user = TwitterUser.new(current_user)
    @tweets = twitter_user.get_timeline
    # binding.pry
  end

  def create
    auth = request.env["omniauth.auth"]
    current_user.find_or_create_authentication(auth['provider'], auth['uid'], auth['credentials']['token'], auth['credentials']['secret'])   
      
    flash[:notice] = "AIYO IT WORKS"
    twitter
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