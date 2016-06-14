module DecoyHelper
  def maybe_decoy_for(deck_word)
    deck_word.pinyin
  end
  
  def decoy_for(quizzed_word)
    WrongChoices.options_for(quizzed_word).first.pinyin
  end

  def another_decoy_for(quizzed_word)
    WrongChoices.options_for(quizzed_word).last.pinyin
  end
end
