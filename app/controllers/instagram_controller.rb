class InstagramController < ApplicationController
  def index
    client = Instagram.client(:access_token => current_user.instagram_authentication.token)
    @instas = client.media_popular
    @insta_newsfeed = client.user_media_feed
    
    # @insta_like = client.like_media
    # @insta_unlike = client.unlike_media
  end

  def search
    client = Instagram.client(:access_token => current_user.instagram_authentication.token)
    search = client.tag_search(params[:search])
    @media_item = client.tag_recent_media(search[0].name)
    
    # @media_item.images[0].thumbnail.url
    # @media_item = client.tag_recent_media(search[0].name)[0].user.username
  end 

  def like 
    client = Instagram.client(:access_token => current_user.instagram_authentication.token)
    binding.pry
    client.like_media(params[:id])
    redirect_to instagram_index_path
  end 

  def unlike
    client = Instagram.client(:access_token => current_user.instagram_authentication.token)
    client.unlike_media(params[:id])
  
  end 

  def search_by_user
    client = Instagram.client(:access_token => current_user.instagram_authentication.token)
    @user_item = client.user_search(params[:search_user])
  end 

  ###each one of these functions may need to be put into a different controller after we have decided on 
  ###which ones to actually impletemnt
end
