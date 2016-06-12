class Score
  def self.record(deck, user, score)
    weight = assign_weight(score)
    user_deck = UserDeck.find_or_create_by( deck_id: deck.id,
                                            user_id: user.id )
    StudySession.create( date: Time.now,
                         user_deck_id: user_deck.id,
                         score: score,
                         weight: weight )
  end

  def self.assign_weight(score)
    if score <= 3
      assign_novice_weight = 1
    elsif score == 7
      assign_master_weight = 3
    else
      assign_badass_in_training_weight = 2
    end
  end
end
