require 'rails_helper'

RSpec.describe DeckWord, type: :model do
  context "associations" do
    it { should belong_to(:deck) }
    it { should belong_to(:question) }
    it { should belong_to(:word) }
  end

  context "can find next or previous deck word" do
    before(:each) do
      create_list(:deck_word, 3)
    end

    it "finds the next deck word" do
      current_deck_word = DeckWord.find(2)
      next_deck_word = DeckWord.find_next_for(current_deck_word.id)

      expect(next_deck_word.id).to eq(3)
      expect(next_deck_word).not_to eq(current_deck_word)

      current_deck_word = DeckWord.find(3)
      next_deck_word = DeckWord.find_next_for(current_deck_word.id)

      expect(next_deck_word.id).to eq(3)
      expect(next_deck_word).to eq(current_deck_word)
    end
  end
end
