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
      current_deck      = DeckQuestionWord.where(question_id: 1).limit(7)
      current_deck_word = DeckQuestionWord.first
      next_deck_word    = DeckQuestionWord.find_next_for(current_deck, current_deck_word)

      expect(next_deck_word).not_to eq(current_deck_word)

      current_deck_word = current_deck.last
      next_deck_word    = DeckQuestionWord.find_next_for(current_deck, current_deck_word)

      expect(next_deck_word.id).to eq(current_deck_word.id)
      expect(next_deck_word).to eq(current_deck_word)
    end
  end

  context "can return attributes via methods" do
    before(:each) do
      @deck_word = create(:deck_question_word)
      @word      = @deck_word.word
      @question  = @deck_word.question
    end

    it "can provide its word's pinyin" do
      expect(@deck_word.pinyin).to eq(@word.pinyin)
    end

    it "can provide its word's simplified character" do
      expect(@deck_word.simp).to eq(@word.simp)
    end

    it "can provide its word's definition" do
      expect(@deck_word.definition).to eq(@word.definition)
    end

    it "can provide its word's question" do
      expect(@deck_word.question_name).to eq(@question.name)
    end
  end

  context "handle decks" do
    attr_reader :deck_id,
                :current_deck,
                :shuffled_deck

    before(:each) do
      create_list(:deck_question_word, 14)
      @deck_id       = 1
      @current_deck  = DeckQuestionWord.set_deck(deck_id)
    end

    it "can set a deck of seven words" do
      expect(current_deck.count).to eq(7)
      expect(current_deck.first.deck).to eq(Deck.find(deck_id))
    end

    it "can return a new deck of shuffled words" do
      original_first_word = current_deck.first
      shuffled_deck       = DeckQuestionWord.shuffle_deck(current_deck, deck_id)
      
      expect(shuffled_deck.first).not_to eq(original_first_word)
      expect(shuffled_deck.last).to eq(current_deck.last)
    end
  end

  context "can mark a question word as correct" do
    before(:each) do
      @deck_question_word = create(:deck_question_word)
    end

    it "can change its status to incorrect" do
      expect(@deck_question_word.is_correct).to eq("true")

      change = @deck_question_word.false!

      expect(change).not_to eq ("true")
      expect(@deck_question_word.is_correct).to eq("false")
    end
  end
end
