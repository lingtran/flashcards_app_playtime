require 'rails_helper'

RSpec.describe "user can choose a deck", type: :feature do
  VCR.use_cassette "logged_in#user_chooses_a_deck" do
    scenario "user can choose a deck upon logging in" do
      deck_one = create(:deck)
      deck_two = create(:deck, :definition_deck)
      create(:question)
      question_two = create(:question, :definition_question)
      deck_question_one = create(:deck_question_word)
      word_one, word_two = create_list(:word, 2)
      deck_question_two_a = create(:deck_question_word, deck_id: deck_two.id, question_id: question_two.id, word_id: word_one.id)
      deck_question_two_b = create(:deck_question_word, deck_id: deck_two.id, question_id: question_two.id, word_id: word_two.id)

      user = set_user

      visit root_path
      click_link "Sign in with Facebook"

      expect(page).to have_content deck_one.name
      expect(page).to have_content deck_two.name
      click_link "#{deck_two.name}"

      expect(page).to have_current_path flashcard_user_path(user, deck_two)

      within("#flashcard-0-header") do
        expect(page).to have_content word_one.simp
      end

      within("#flashcard-0-question") do
        expect(page).to have_content question_two.name
      end

      expect(page).to have_current_path flashcard_user_path(user, deck_two)

      directional_buttons = page.all(".ui button")

      expect(directional_buttons.count).to eq(4)

      card = page.all("#flashcard-0")

      expect(card.count).to eq(1)

    end
  end
end
