class SoundcloudUser
  attr_reader :user
  
  def initialize(user)
    @user = user
    create_soundcloud_client
  end

  def create_soundcloud_client
    @client = Soundcloud.new({
      :client_id     => '31b35595e00750bf40213344343e81f1',
      :client_secret => '39613d98981c264e14dcbd8dead5896f',
      })
  end

end
