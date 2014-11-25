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
      :redirect_uri  => '127.0.0.1:3000/soundcloud/callback'
      })
  end

  def hot_tracks
    @client.get('/tracks', :limit => 5, :order => 'hotness')
  end

  def embed_music(url)
    begin
      @client.get('/oembed', :url => url)  
    rescue Exception => e
      
    end
    
  end

end
