class InstagramController < ApplicationController
  def index
    client = Instagram.client(:access_token => current_user.authentications.find_by(provider: "instagram").token)
    @instas = client.media_popular
  end
end
