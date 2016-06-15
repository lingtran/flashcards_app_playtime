module DataHelpers
  def load_associations_btwn_users_user_decks_study_sessions
    create_deck
    create_users
    create_user_decks
    create_study_sessions
  end

  def create_deck
    @_deck = create(:deck)
  end

  def create_users
    @_first_user, @_second_user = create_list(:user, 2)
  end

  def create_user_decks
    @_first_user_deck = create(:user_deck, user_id: first_user.id, deck_id: deck.id)
    @_second_user_deck = create(:user_deck, user_id: second_user.id, deck_id: deck.id)
  end

  def create_study_sessions
    scores = [1, 4, 6 ,7]

    24.times do |n|
      score = scores.shuffle.sample
      ScoreConversion.process(deck, first_user, score)

      score = scores.shuffle.sample
      ScoreConversion.process(deck, second_user, score)
    end
  end

  private
    def deck
      @_deck
    end

    def first_user
      @_first_user
    end

    def second_user
      @_second_user
    end

    def first_user_deck
      @_first_user_deck
    end

    def second_user_deck
      @_second_user_deck
    end
end
