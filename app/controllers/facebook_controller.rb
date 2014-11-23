class FacebookController < ApplicationController

  def index
    client = FacebookUser.new(current_user)
    @posts = client.profile_info
  end

end


