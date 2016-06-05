class User < ActiveRecord::Base
  def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash[:uid])

    user.uid                = auth_hash.uid
    user.provider           = auth_hash.provider
    user.name               = auth_hash.extra.raw_info.name
    user.username           = auth_hash.extra.raw_info.username
    user.email              = auth_hash.extra.raw_info.email
    user.oauth_token        = auth_hash.credentials.token
    user.oauth_expires_at   = auth_hash.credentials.expires_at
    user.save!

    user
  end
end
