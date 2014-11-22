class InstagramController < ApplicationController
  def index
    
    @instas = instagram_user.media_popular
    @insta_newsfeed = client.user_media_feed
    
    # @insta_like = client.like_media
    # @insta_unlike = client.unlike_media
  end

  def search
    client = Instagram.client(:access_token => current_user.instagram_authentication.token)
    search = client.tag_search(params[:search])
    @media_item = client.tag_recent_media(search[0].name)
    # @media_item.images[0].thumbnail.url
  end 

  ###each one of these functions may need to be put into a different controller after we have decided on 
  ###which ones to actually impletemnt
end
