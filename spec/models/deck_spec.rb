require 'rails_helper'

RSpec.describe Deck, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "association" do
    it { should have_many(:user_decks) }
    it { should have_many(:users).through(:user_decks) }
  end
end
