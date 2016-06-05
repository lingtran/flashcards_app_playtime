module OmniAuthHelpers
  def set_user
    User.from_omniauth(stub_omniauth)
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: "facebook",
      uid: "1234",
      extra: {
        raw_info: {
          raw_id: "1234",
          name: "Ling",
          login: "lxiutran"
        }
      },
      credentials: {
        token: ENV['?'],
        secret: ENV['facebook_secret']
      }
      })
  end
end
