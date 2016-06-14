class Seed
  attr_reader :pinyin_question,
              :definition_question,
              :pinyin_deck,
              :definition_deck,
              :novice_words,
              :badass_in_training_words,
              :master_words,
              :first_user,
              :second_user,
              :third_user,
              :first_user_deck_def,
              :first_user_deck_pinyin,
              :second_user_deck_def,
              :second_user_deck_pinyin,
              :third_user_deck_pinyin

  def self.start
    seed = Seed.new

    seed.generate_users
    seed.generate_questions
    seed.generate_decks
    seed.generate_user_decks
    seed.generate_study_sessions_for_first_user
    seed.generate_study_sessions_for_second_user
    seed.generate_study_sessions_for_third_user
    seed.generate_words
    seed.generate_deck_question_words_novice_for_pinyin
    seed.generate_deck_question_words_badass_in_training_for_pinyin
    seed.generate_deck_question_words_master_for_pinyin
    seed.generate_deck_question_words_novice_for_definition
    seed.generate_deck_question_words_badass_in_training_for_definition
    seed.generate_deck_question_words_master_for_definition
  end

  def generate_users
    100.times do |n|
      # need to add names
      User.create(email: "user#{n}@lingoapp.fake", password: "password", provider: "lingoapp")
    end
    puts "Generate users"
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

  def generate_user_decks
    decks = [pinyin_deck, definition_deck]

    100.times do
      deck = decks.shuffle.sample.id
      User.all.each do |user|
        UserDeck.create(user_id: user.id, deck_id: deck.)
      end
    end
    puts "Generate user decks"
  end

  def generate_study_sessions_for_first_user
    weights = [0, 1, 2]
    scores = [0, 1, 2, 3, 4, 5, 6, 7]
    dates = ["2016-06-08 12:05:18", "2016-06-11 06:05:18", "2016-06-09 09:05:18", "2016-06-09 09:15:18", "2016-06-09 09:25:18", "2016-06-09 09:45:18", "2016-06-15 12:05:18", "2016-06-15 11:05:18", "2016-06-15 12:15:18", "2016-06-15 12:25:18", "2016-06-15 12:55:18", "2016-06-15 12:59:18", "2016-06-25 12:05:18", "2016-06-16 12:05:15", "2016-06-18 06:06:18", "2016-06-15 12:09:19", "2016-06-15 12:05:18", "2016-06-15 22:05:18", "2016-06-15 09:05:18", "2016-06-15 08:05:18"]
    # took a break here in asserting sample dates
    decks = UserDeck.all

    20.times do
      score = scores.shuffle.sample
      weight = weights.shuffle.sample
      date = dates.shuffle.sample
      deck_id = decks.shuffle.sample.id

      StudySession.create( date: date, user_deck_id: deck_id, score: score, weight: weight )
    end

    puts "Generate study sessions for first user"
  end

  def generate_study_sessions_for_second_user
    weights = [0, 1, 2]
    scores = [0, 1, 2, 3, 4, 5, 6, 7]
    dates = { most_recent: "2016-06-11 12:05:18", three_days_later: "2016-06-14 06:05:18", next_day: "2016-06-10 09:05:18"}
    decks = [second_user_deck_def, second_user_deck_pinyin]

    40.times do
      score = scores.shuffle.sample
      weight = weights.shuffle.sample
      date = dates.values.shuffle.sample
      deck_id = decks.shuffle.sample.id

      StudySession.create( date: date, user_deck_id: deck_id, score: score, weight: weight )
    end

  def generate_study_sessions_for_mutiple_users
    weights = [0, 1, 2]
    scores = [0, 1, 2, 3, 4, 5, 6, 7]
    dates = { most_recent: "2016-06-08 12:05:18", three_days_later: "2016-06-11 06:05:18", next_day: "2016-06-09 09:05:18"}
    decks = [first_user_deck_def, first_user_deck_pinyin]

    20.times do
      score = scores.shuffle.sample
      weight = weights.shuffle.sample
      date = dates.values.shuffle.sample
      deck_id = decks.shuffle.sample.id

      StudySession.create( date: date, user_deck_id: deck_id, score: score, weight: weight )
    end

    puts "Generate study sessions for second user"
  end

  def generate_study_sessions_for_third_user
    weights = [0, 1, 2]
    scores = [0, 1, 2, 3, 4, 5, 6, 7]
    dates = { most_recent: "2016-06-11 12:05:18", three_days_later: "2016-06-14 06:05:18", next_day: "2016-06-10 09:05:18"}
    deck_id = third_user_deck_pinyin.id

    50.times do
      score = scores.shuffle.sample
      weight = weights.shuffle.sample
      date = dates.values.shuffle.sample

      StudySession.create( date: date, user_deck_id: deck_id, score: score, weight: weight )
    end

    puts "Generate study sessions for third user"
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
