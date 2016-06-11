require 'rails_helper'

RSpec.describe DeckQuestionWord, type: :model do
  context "associations" do
    it { should belong_to(:deck) }
    it { should belong_to(:question) }
    it { should belong_to(:word) }
  end

  context "can find next or previous deck word" do
    before(:each) do
      create_list(:deck_question_word, 7)
    end

    it "finds the next deck word" do
      current_deck = DeckQuestionWord.where(question_id: 1).limit(7)
      current_deck_word = DeckQuestionWord.first
      next_deck_word = DeckQuestionWord.find_next_for(current_deck, current_deck_word)

      expect(next_deck_word).not_to eq(current_deck_word)

      current_deck_word = current_deck.last
      next_deck_word = DeckQuestionWord.find_next_for(current_deck, current_deck_word)

      expect(next_deck_word.id).to eq(current_deck_word.id)
      expect(next_deck_word).to eq(current_deck_word)
    end
  end
end
