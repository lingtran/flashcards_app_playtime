require 'rails_helper'

RSpec.describe StudySession, type: :model do
  context "validations" do
    it { should validate_presence_of(:score) }
    it { should validate_presence_of(:date) }
  end

  context "associations" do
    it { should belong_to(:user_deck) }
  end
end
