class User < ActiveRecord::Base
  
  has_many :authentications

  authenticates_with_sorcery!


  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def find_or_create_authentication(provider, token)
    provider_auth = authentications.find_by(provider: provider)

    if !provider_auth
      authen = Authentication.new
      authen.provider = provider
      authen.uid = token
      authen.user_id = self.id
      authen.save!
    elsif provider_auth && provider_auth.uid != token
      puts "Hello world"
      provider_auth.uid = token
      provider_auth.save!
    end
    
  end
end