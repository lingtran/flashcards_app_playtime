class Seed
  attr_reader :pinyin_question, :definition_question, :pinyin_deck, :definition_deck, :novice_words, :badass_in_training_words, :master_words

  def self.start
    seed = Seed.new

    seed.generate_questions
    seed.generate_decks
    seed.generate_words
    seed.generate_deck_question_words_novice_for_pinyin
    seed.generate_deck_question_words_badass_in_training_for_pinyin
    seed.generate_deck_question_words_master_for_pinyin
    seed.generate_deck_question_words_novice_for_definition
    seed.generate_deck_question_words_badass_in_training_for_definition
    seed.generate_deck_question_words_master_for_definition
  end

  def generate_questions
    @pinyin_question = Question.create(name: "Select the correct pinyin", focus_area: 0)
    @definition_question = Question.create(name: "Select the correct definition", focus_area: 1)
    puts "Generate questions"
  end

  def generate_decks
    @pinyin_deck = Deck.create(name: "Pinyin")
    @definition_deck = Deck.create(name: "Definition")
    puts "Generate decks"
  end

  def generate_words
    words = Word.order("RANDOM()").limit(100)
    @novice_words = words[0..19]
    @badass_in_training_words = words[20..39]
    @master_words = words[40..99]
    puts "Generate words"
  end

  def generate_deck_question_words_novice_for_pinyin
    novice_words.each do |word|
      DeckQuestionWord.create(deck_id: pinyin_deck.id, question_id: pinyin_question.id, word_id: word.id, is_correct: 0, level: 0)
    end
    puts "Generate words for pinyin deck at novice level"
  end

  def generate_deck_question_words_badass_in_training_for_pinyin
    badass_in_training_words.each do |word|
      DeckQuestionWord.create(deck_id: pinyin_deck.id, question_id: pinyin_question.id, word_id: word.id, is_correct: 0, level: 1)
    end
    puts "Generate words for pinyin deck at badass_in_training level"
  end

  def generate_deck_question_words_master_for_pinyin
    master_words.each do |word|
      DeckQuestionWord.create(deck_id: pinyin_deck.id, question_id: pinyin_question.id, word_id: word.id, is_correct: 0, level: 2)
    end
    puts "Generate words for pinyin deck at master level"
  end

  def generate_deck_question_words_novice_for_definition
    novice_words.each do |word|
      DeckQuestionWord.create(deck_id: definition_deck.id, question_id: definition_question.id, word_id: word.id, is_correct: 0, level: 0)
    end
    puts "Generate words for definition deck at novice level"
  end

  def generate_deck_question_words_badass_in_training_for_definition
    badass_in_training_words.each do |word|
      DeckQuestionWord.create(deck_id: definition_deck.id, question_id: definition_question.id, word_id: word.id, is_correct: 0, level: 1)
    end
    puts "Generate words for definition deck at badass_in_training level"
  end

  def generate_deck_question_words_master_for_definition
    master_words.each do |word|
      DeckQuestionWord.create(deck_id: definition_deck.id, question_id: definition_question.id, word_id: word.id, is_correct: 0, level: 2)
    end
    puts "Generate words for definition deck at badass_in_training level"
  end
end

Seed.start
