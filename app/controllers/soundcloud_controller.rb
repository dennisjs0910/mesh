class SoundcloudController < ApplicationController

  def index
    @sounds = soundcloud_user.hot_tracks

    @sounds.each do |sound|
      # 'http://soundcloud.com/forss/flickermood'
      #puts sound.permalink_url
      sound[:iframe_html] = soundcloud_user.embed_music(sound.permalink_url)
    end
  end

end