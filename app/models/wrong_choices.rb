class WrongChoices
  def self.options_for(quizzed_word)
    Word.order("RANDOM()").where.not(simp: quizzed_word).limit(2)
  end
end
