require 'rails_helper'

RSpec.describe User, type: :model do
  context "existing user" do
    it "can find user" do
      user = stub_omniauth

      expect(user.provider).to eq("facebook")
      expect(user.uid).to eq("1234")
      expect(user.info.email).to eq("chocolatier@someday.org")
    end
  end

  context "validations" do
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:provider) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:oauth_token) }

    it { should_not validate_presence_of(:name) }
    it { should_not validate_presence_of(:oauth_expires_at) }
    it { should_not validate_presence_of(:graph) }
  end

  context "associations" do
    it { should have_many(:user_decks) }
    it { should have_many(:decks).through(:user_decks) }
  end
end
