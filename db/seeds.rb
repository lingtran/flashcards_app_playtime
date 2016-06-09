question = Question.create(name: "Select the correct pinyin")

deck = Deck.create(name: "Random")

words = Word.order("RANDOM()").take(5)

words.each do |word|
  DeckWord.create(deck_id: deck.id, question_id: question.id, word_id: word.id)
end
