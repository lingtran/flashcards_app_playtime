module DecoyHelper
  def decoys(quizzed_word)
    WrongChoices.options_for(quizzed_word)
  end
end
