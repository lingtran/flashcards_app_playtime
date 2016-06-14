module ButtonDeterminationHelper
  def next_or_finish_given(deck_word, current_deck)
    if deck_word == current_deck.last
      submit_tag "Finish", id: "booyeah-done", class: "submit-button ui teal button"
    else
      submit_tag "Next", id: "next-card", class: "submit-button ui teal button"
    end
  end
end
