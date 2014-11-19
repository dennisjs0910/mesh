class SoundcloudController < ApplicationController
  def index
    soundcloud_user = SoundcloudUser.new(current_user)
    binding.pry
    @sounds = soundcloud_user
    # :limit => 10, :order => 'hotness'
  end
end