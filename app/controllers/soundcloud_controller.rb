class SoundcloudController < ApplicationController

  def index
    @sounds = soundcloud_user.hot_tracks
  end

end