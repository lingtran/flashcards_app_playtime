FactoryGirl.define do
  factory :question do
    name "Select the correct pinyin"
  end

  factory :deck do
    name "Test Deck"
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

  factory :deck_word do
    deck { Deck.first || association(:deck) }
    association(:word)
    question { Question.first || association(:question) }
  end
end
