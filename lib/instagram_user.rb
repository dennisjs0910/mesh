class InstagramUser
  attr_reader :user
  
  def initialize(user)
    @user = user
    create_instagram_client
  end

  def create_instagram_client
    @client = Instagram.configure do |config|
    config.client_id = "b3d6f75cc55946d193ad37d0395356fa"
    config.client_secret = "9c592f5c2e004a48893c7636b6e585e4"
    end
  end

end