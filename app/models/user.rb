class User < ActiveRecord::Base
  # has_secure_password

  has_many :user_decks
  has_many :decks, through: :user_decks

  validates :provider, presence: true
  validates :email, presence: true

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash[:uid])

    user.uid                = auth_hash.uid
    user.provider           = auth_hash.provider
    user.name               = auth_hash.info.name
    user.email              = auth_hash.info.email
    user.graph              = auth_hash.info.image
    user.oauth_token        = auth_hash.credentials.token
    user.oauth_expires_at   = auth_hash.credentials.expires_at
    user.save!

    user
  end
end

# validates :email, presence: true, uniqueness: true
# validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
