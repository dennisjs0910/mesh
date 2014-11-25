class User < ActiveRecord::Base
  
  has_many :authentications

  authenticates_with_sorcery!


  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def find_or_create_authentication(provider, uid, token, secret)
    provider_auth = authentications.find_by(provider: provider)

    if !provider_auth
      authen = Authentication.new
      authen.provider = provider
      authen.uid = uid
      authen.user_id = self.id

      authen.token = token
      authen.secret = secret
      authen.save!

    elsif provider_auth.secret == nil && provider_auth && provider_auth.token != token
      puts "Hello world"
      provider_auth.uid = uid
      provider_auth.token = token
      provider_auth.save!

    else
      puts "This"
      provider_auth.uid = uid
      provider_auth.token = token
      provider_auth.save!
    end
    
  end

  def twitter_authentication
    self.authentications.find_by(provider: :twitter)
  end

  def instagram_authentication
    self.authentications.find_by(provider: :instagram)
  end

  def facebook_authentication
    self.authentications.find_by(provider: :facebook)
  end 

end