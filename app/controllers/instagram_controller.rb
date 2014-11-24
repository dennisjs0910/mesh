class InstagramController < ApplicationController
  before_action :client
  
  def index
    @instas = client.media_popular
    @insta_newsfeed = client.user_media_feed
  end

  def search
    search = client.tag_search(params[:search])
    @media_item = client.tag_recent_media(search[0].name)
  end 

  def like 
    binding.pry
    client.like_media(params[:id])
  end 

  def unlike
    client.unlike_media(params[:id])
  end 

  def search_by_user
    @user_item = client.user_search(params[:search_user])
  end 

  private

  def client
    @client = Instagram.client(:access_token => current_user.instagram_authentication.token)
  end

  ###each one of these functions may need to be put into a different controller after we have decided on 
  ###which ones to actually impletemnt
end
