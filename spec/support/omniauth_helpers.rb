module OmniAuthHelpers
  def set_user
    User.from_omniauth(stub_omniauth)
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: "facebook",
      uid: "1234",
      info: {
        email: "chocolatier@someday.org",
        password: "chocolate"
      },
      credentials: {
        token: ENV['facebook_user_token'],
        secret: ENV['facebook_secret']
      }
      })
  end

  def user_logs_in
    set_user
    visit root_path
    click_link "Sign in with Facebook"
  end
end
