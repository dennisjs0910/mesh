class FacebookUser
  attr_reader :user
  
  def initialize(user)
    @user = user
    @oauth_token = user.facebook_authentication.token
    create_facebook_client
  end

  def create_facebook_client
    @client = Koala::Facebook::API.new(@oauth_token)
  end

  def profile_info
    @client.get_object("me?fields=name,picture")
  end

  def newsfeed_info
  end 

end