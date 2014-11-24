require 'pry'

class AuthenticationsController < ApplicationController

  before_action :require_user, only: [:index]

  def index
    @authentications = current_user.authentications
  end

  def create
    auth = request.env["omniauth.auth"]
      #twitter
    if auth['credentials']['secret']
      current_user.find_or_create_authentication(auth['provider'], auth['uid'], auth['credentials']['token'], auth['credentials']['secret']) 
    else
      #instagram
      current_user.find_or_create_authentication(auth['provider'], auth['uid'], auth['credentials']['token'], "empty")
    end 
      
    flash[:notice] = "AIYO IT WORKS"
    redirect_to authentications_url
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.active = false
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end