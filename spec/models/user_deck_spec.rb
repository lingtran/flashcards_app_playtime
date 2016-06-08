require 'rails_helper'

RSpec.describe UserDeck, type: :model do
  context "associations" do
    it { is_expected.to belong_to(:deck) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:study_sessions) }
  end
end
