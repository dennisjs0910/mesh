class SoundcloudController < ApplicationController

  def index
    @sounds = soundcloud_user.hot_tracks
    @sounds.each do |sound|
      sound[:iframe_html] = soundcloud_user.embed_music(sound.permalink_url)
    end
 
  end

  def search
    @results = soundcloud_user.search(params[:search])
    @results.each do |result|
      result[:iframe_html] = soundcloud_user.embed_music(result.permalink_url)
    end
  end

end