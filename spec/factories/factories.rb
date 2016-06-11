FactoryGirl.define do
  factory :question do
    name "Select the correct pinyin"
    focus_area 0

    trait :definition_question do
      name "Select the correct definition"
      focus_area 1
    end
  end

  factory :deck do
    name "Test Pinyin Deck"

    trait :definition_deck do
      name "Test Definition Deck"
    end
  end

  factory :word do
    sequence(:trad) { |n| "點心(#{n})" }
    sequence(:simp) { |n| "点心(#{n})" }
    sequence(:pinyin) { |n| "dian3xin4(#{n})" }
    sequence(:definition) { |n| "dimsum; think Chinese tapas meets tea time (#{n})" }

    trait :decoy_words do
      sequence(:trad, 3) { |n| "點心(#{n})" }
      sequence(:simp, 3) { |n| "点心(#{n})" }
      sequence(:pinyin, 3) { |n| "dian3xin4(#{n})" }
      sequence(:definition, 3) { |n| "dimsum; think Chinese tapas meets tea time (#{n})" }
    end

    factory :decoys, traits: [:decoy_words]
  end

  factory :deck_question_word do
    deck { Deck.first || association(:deck) }
    association(:word)
    question { Question.first || association(:question) }
    is_correct 0
    level 0

    trait :novice do
      0
    end

    trait :badass_in_training_level do
      level 1
    end

    trait :master_level do
      level 2
    end
  end
end
