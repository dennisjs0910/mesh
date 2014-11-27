class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end

  def require_user
    not_authenticated unless current_user
  end

  def twitter_user
    @twitter_user ||= TwitterUser.new(current_user)
  end

  def soundcloud_user
    @soundcloud_user ||= SoundcloudUser.new(current_user)
  end

  def reddit_user
    @reddit_user ||= RedditUser.new(current_user)
  end 
  
end
