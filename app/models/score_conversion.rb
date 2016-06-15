class ScoreConversion
  def self.process(deck, user, score)
    weight = send(:assign_weight, score)

    user_deck = user_deck_set_handler(deck, user)

    study_session_handler(user_deck, score, weight)

    user_deck = user_deck_update_handler(user_deck)
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

  def self.user_deck_set_handler(deck, user)
    UserDeck.find_or_create_by( deck_id: deck.id,
                                user_id: user.id )
  end

  def self.study_session_handler(user_deck, score, weight)
    StudySession.create( date: Time.now,
                         user_deck_id: user_deck.id,
                         score: score,
                         weight: weight )
  end

  def self.user_deck_update_handler(user_deck)
    new_avg_score = user_deck.weighted_score_over_time
    level = assign_weight(new_avg_score)
    study_rate = user_deck.calculate_study_rate_per_week

    user_deck.update( average_deck_score: new_avg_score,
                      mastery_level: level,
                      study_rate_per_week: study_rate)
    user_deck
  end
end
