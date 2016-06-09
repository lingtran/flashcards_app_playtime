require 'rails_helper'

RSpec.describe "user goes through a deck", type: :feature do
  VCR.use_cassette "logged_in#user_goes_through_deck" do
    scenario "user can answer questions in a deck" do
      word_one, word_two = create_list(:deck_word, 2)
      word_one = word_one.word
      word_two = word_two.word
      create_list(:decoys, 5)
      decoys_set_one = WrongChoices.options_for(word_one.simp)
      user = user_logs_in

      expect(page).to have_current_path flashcards_path

      # first word
      within(page.all("#flashcards")[0]) do
        expect(page).to have_content word_one.simp
        expect(page).to have_content "Select the correct pinyin"
      end

      # within(page.all(input[name=correct_choice])[0]) do
        expect(page).to have_content word_one.pinyin
        # expect(page).not_to have_content decoys_set_one.first.pinyin
      # end
      # user checks circle for correct answer to first word
      # within(page.all("#correct-choice")[0]) do
        find("#correct_choice").choose("#{word_one.pinyin}")
      # end

      # user clicks on next arrow
      click_button("Save")

      # # second word
      # within("#flashcards") do
      #   expect(page).to have_content words.last.simp
      #   expect(page).to have_content "Select the correct pinyin"
      # end
      #
      # # user checks circle for incorrect answer to last word
      # within(".choice deck-section") do
      #   choose("#{wrong_choices.second.pinyin}")
      # end
      #
      # # user clicks on next arrow
      # click_link("Next")

      # score pops up, where score should be 1 out of 2 questions were correct
      within(".score-popup") do
        expect(page).to have_content "Score: 1 correct answer / 2 total cards in deck"
      end

      # and when complete, will see a flash that says "Great work. You can try again!"
      expect(page).to have_content "Great work. Keep at it!"
    end
  end
end
