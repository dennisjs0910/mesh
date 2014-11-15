class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    # if user already has an authentication for this provider
      # update the uid with the latest token
    # if the user doesn't have an authentication for the provider
      # create an authentication with the provider and uid
    current_user.find_or_create_authentication(auth['provider'], auth['uid'])    
    # current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
    flash[:notice] = "AIYO IT WORKS"
    redirect_to authentications_url
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end