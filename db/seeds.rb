class Seed
  attr_reader :pinyin_question,
              :random_deck,
              :random_deck_two,
              :slang_deck,
              :slang_deck_two,
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
              :third_user_deck_pinyin,
              :slang_words

  def self.start
    seed = Seed.new

    seed.generate_users
    seed.generate_questions
    seed.generate_decks
    seed.generate_user_decks
    seed.generate_study_sessions_for_users
    seed.generate_words
    seed.generate_deck_question_words_novice_for_random_deck
    seed.generate_deck_question_words_badass_in_training_for_random_deck
    seed.generate_deck_question_words_master_for_random_deck
    seed.generate_deck_question_words_novice_for_random_deck_two
    seed.generate_deck_question_words_badass_in_training_for_random_deck_two
    seed.generate_deck_question_words_master_for_random_deck_two
    seed.generate_slang_words
    seed.generate_deck_question_words_novice_for_slang_deck
    seed.generate_deck_question_words_novice_for_slang_deck_two
  end

  def generate_users
    5.times do |n|
      User.create(name: "Ethel#{n}", email: "user#{n}@lingoapp.fake", password: "password", provider: "lingoapp")
      User.create(name: "Fred#{n}", email: "user#{n}@lingoapp.fake", password: "password", provider: "lingoapp")
    end
    puts "Generate users"
  end

  def generate_questions
    @pinyin_question = Question.create(name: "Select the correct pinyin", focus_area: 0)
    puts "Generate questions"
  end

  def generate_decks
    @random_deck = Deck.create(name: "Random Deck 《随机抽认卡》")
    @random_deck_two = Deck.create(name: "Random Deck 2 《随机抽认卡（第二集)》")
    @slang_deck = Deck.create(name: "Slang Deck 《口语抽认卡》")
    @slang_deck_two = Deck.create(name: "Slang Deck 2 《口语抽认卡（第二集)》")
    puts "Generate decks"
  end

  def generate_user_decks
    decks = [random_deck, slang_deck, random_deck_two, slang_deck_two]

    20.times do
      deck = decks.shuffle.sample.id
      User.all.each do |user|
        UserDeck.create(user_id: user.id, deck_id: deck)
      end
    end
    puts "Generate user decks"
  end

  def generate_study_sessions_for_users
    weights = [1, 2, 3]

    scores = [1,
              2,
              2.5,
              3,
              3.1,
              4.4,
              5,
              5.25,
              5.6,
              6,
              6.10,
              6.9,
              7]

    dates = ["2016-06-08 12:05:18",
              "2016-06-11 06:05:18",
              "2016-06-09 09:05:18",
              "2016-06-09 09:15:18",
              "2016-06-09 09:25:18",
              "2016-06-09 09:45:18",
              "2016-06-10 12:05:18",
              "2016-06-11 11:05:18",
              "2016-06-12 12:15:18",
              "2016-06-13 12:25:18",
              "2016-06-14 12:55:18",
              "2016-06-14 12:59:18",
              "2016-06-14 12:05:18",
              "2016-06-14 12:05:15",
              "2016-06-14 06:06:18",
              "2016-06-15 12:09:19",
              "2016-06-15 12:05:18",
              "2016-06-15 22:05:18",
              "2016-06-15 09:05:18",
              "2016-06-15 09:07:18",
              "2016-06-15 09:08:18",
              "2016-06-15 09:09:18",
              "2016-06-15 09:10:18",
              "2016-06-15 09:11:18",
              "2016-06-15 08:12:18"]

    decks = UserDeck.all

    70.times do
      score = scores.shuffle.sample
      weight = weights.shuffle.sample
      date = dates.shuffle.sample
      deck_id = decks.shuffle.sample.id

      StudySession.create( date: date, user_deck_id: deck_id, score: score, weight: weight )
    end

    new_scores = [1,
              2,
              2.5,
              3,
              3.1,
              4.4,
              5,
              5.25,
              5.6,
              6,
              6.10,
              6.9,
              7]

    study_rates = [0.513,
                   1.546,
                   2.345,
                   3.450,
                   4.789,
                   5.789,
                   6.901]

    UserDeck.all.each do |user_deck|
      new_avg_score = new_scores.shuffle.sample

      if new_avg_score <= 3
        level = 1
      elsif new_avg_score == 7
        level = 3
      else
        level = 2
      end

      study_rate = study_rates.shuffle.sample

      user_deck.update( average_deck_score: new_avg_score,
                        mastery_level: level,
                        study_rate_per_week: study_rate )
    end

    puts "Generate study sessions for users"
  end

  def generate_words
    words = Word.order("RANDOM()").limit(100)
    @novice_words = words[0..19]
    @badass_in_training_words = words[20..39]
    @master_words = words[40..99]
    puts "Generate words"
  end

  def generate_deck_question_words_novice_for_random_deck
    novice_words.each do |word|
      DeckQuestionWord.create(deck_id: random_deck.id, question_id: pinyin_question.id, word_id: word.id, is_correct: 0, level: 0)
    end
    puts "Generate words for random deck at novice level"
  end

  def generate_deck_question_words_novice_for_random_deck_two
    novice_words.each do |word|
      DeckQuestionWord.create(deck_id: random_deck_two.id, question_id: pinyin_question.id, word_id: word.id, is_correct: 0, level: 0)
    end
    puts "Generate words for random deck two at novice level"
  end

  def generate_deck_question_words_badass_in_training_for_random_deck
    badass_in_training_words.each do |word|
      DeckQuestionWord.create(deck_id: random_deck.id, question_id: pinyin_question.id, word_id: word.id, is_correct: 0, level: 1)
    end
    puts "Generate words for random deck at badass_in_training level"
  end

  def generate_deck_question_words_badass_in_training_for_random_deck_two
    badass_in_training_words.each do |word|
      DeckQuestionWord.create(deck_id: random_deck_two.id, question_id: pinyin_question.id, word_id: word.id, is_correct: 0, level: 1)
    end
    puts "Generate words for random deck two at badass_in_training level"
  end

  def generate_deck_question_words_master_for_random_deck
    master_words.each do |word|
      DeckQuestionWord.create(deck_id: random_deck.id, question_id: pinyin_question.id, word_id: word.id, is_correct: 0, level: 2)
    end
    puts "Generate words for random deck at master level"
  end

  def generate_deck_question_words_master_for_random_deck_two
    master_words.each do |word|
      DeckQuestionWord.create(deck_id: random_deck_two.id, question_id: pinyin_question.id, word_id: word.id, is_correct: 0, level: 2)
    end
    puts "Generate words for random deck two at master level"
  end

  def raw_slang_words
    [{ trad: "萌萌噠", simp: "萌萌哒", pinyin: "meng2 meng2 da1", definition: "describing people who are very cute" },
     { trad: "麼麼噠", simp: "么么哒", pinyin: "me5 me5 da1", definition: "give somebody a kiss (mostly used in message chatting)" },
     { trad: "女漢子", simp: "女汉子", pinyin: "nv3 han4 zi5", definition: "describe girls who are independent and mentally/physically strong" },
     { trad: "也是醉了", simp: "也是醉了", pinyin: "ye3 shi4 zui4 le5", definition: "literally means being drunk, but people use to express the same meaning as 'are you kidding me?'" },
     { trad: "抱大腿", simp: "抱大腿", pinyin: "bao4 da5 tui3", definition: "take advantage of people who are more brilliant or have more power" },
     { trad: "土豪", simp: "土豪", pinyin: "tu3 hao2", definition: "rich people (the original meaning is rich people who are not very educated, but now it means generally rich people)" },
     { trad: "高大上", simp: "高大上", pinyin: "gao1 da4 shang4", definition: "describing anything fancy or high-end" },
     { trad: "你懂的", simp: "你懂的", pinyin: "ni2 dong3 de2", definition: "you can understand what I am saying" },
     { trad: "沒門兒", simp: "没门儿", pinyin: "mei2 menr2 er2", definition: "no way" },
     { trad: "雷人", simp: "雷人", pinyin: "lei2 ren2", definition: "very shocking stuff" },
     { trad: "牛", simp: "牛", pinyin: "niu2", definition: "brilliant, awesome" },
     { trad: "切", simp: "切", pinyin: "qie1", definition: "whatever" },
     { trad: "湊熱鬧", simp: "凑热闹", pinyin: "cou4 re4 nao5", definition: "join the fun/add more trouble" },
     { trad: "小強", simp: "小强", pinyin: "xiao3 qiang2", definition: "cockroach" },
     { trad: "大姨媽", simp: "大姨妈", pinyin: "da4 yi2 ma1", definition: "period (menstrual)" },
     { trad: "腦殘", simp: "脑残", pinyin: "nao3 can2", definition: "stupid; there is something wrong with your head" },
     { trad: "書呆子", simp: "书呆子", pinyin: "shu1 dai1 zi5", definition: "nerd; bookworm; someone who only knows how to study and nothing else" },
     { trad: "菜", simp: "菜", pinyin: "cai4", definition: "the character itself means 'dish', but when it is used as an adjective it means 'it sucks'" },
     { trad: "吃老本", simp: "吃老本", pinyin: "chi1 lao3 ben3", definition: "to rely on past achievements" },
     { trad: "電燈泡", simp: "电灯泡", pinyin: "dian4 deng1 pao4", definition: "phrase itself means 'electric bulb', but colloquially can be used to mean 'thirdwheel'" },
     { trad: "走起", simp: "走起", pinyin: "zou3 qi3", definition: "let's go" },
     { trad: "剩鬥士", simp: "剩斗士", pinyin: "sheng4 dou4 shi4", definition: "someone who can never get a partner, even worse than 'leftover women'" },
     { trad: "炒冷飯", simp: "炒冷饭", pinyin: "chao2 leng3 fan4", definition: "talk about something that is no longer news" },
     { trad: "壓力山大", simp: "压力山大", pinyin: "ya1 li4 shan1 da4", definition: "under a lot of pressure" }]
  end

  def generate_slang_words
    @slang_words = raw_slang_words.shuffle.map do |word|
      Word.create(trad: word[:trad], simp: word[:simp], pinyin: word[:pinyin], definition: word[:definition])
    end

    puts "Generate slang words"
  end

  def generate_deck_question_words_novice_for_slang_deck
    @slang_words.each do |word|
      DeckQuestionWord.create(deck_id: slang_deck.id, question_id: pinyin_question.id, word_id: word.id, is_correct: 0, level: 0)
    end
    puts "Generate words for slang deck at novice level"
  end

  def generate_deck_question_words_novice_for_slang_deck_two
    @slang_words.shuffle.each do |word|
      DeckQuestionWord.create(deck_id: slang_deck_two.id, question_id: pinyin_question.id, word_id: word.id, is_correct: 0, level: 0)
    end
    puts "Generate words for slang deck two at novice level"
  end

end

Seed.start
