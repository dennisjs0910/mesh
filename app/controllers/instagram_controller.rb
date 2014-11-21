class InstagramController < ApplicationController
  def index
    
    @instas = instagram_user.media_popular
    @insta_newsfeed = client.user_media_feed
    # @search_by_tag = client.tag_search(search)
    # @insta_like = client.like_media("#{params[:id]}")
    # @insta_unlike = client.unlike_media("#{params[:id]}")
  
  end

  ###each one of these functions may need to be put into a different controller after we have decided on 
  ###which ones to actually impletemnt
end
