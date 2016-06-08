require 'rails_helper'

RSpec.describe Question, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "associations" do
    it { should have_many(:deck_words) }
    it { should have_many(:words).through(:deck_words) }
  end
end
