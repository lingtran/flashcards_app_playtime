require 'rails_helper'

RSpec.describe DeckWord, type: :model do
  context "associations" do
    it { should belong_to(:deck) }
    it { should belong_to(:question) }
    it { should belong_to(:word) }
  end
end
