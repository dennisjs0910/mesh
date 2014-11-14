class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validate :uid, :provider, presence: true
  # validates_uniqueness_of :uid, :scope => :provider
  validate :uid, uniqueness: {scope: :provider}

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end
end
