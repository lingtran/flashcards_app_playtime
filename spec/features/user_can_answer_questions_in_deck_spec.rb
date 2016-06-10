require 'rails_helper'

RSpec.describe "user goes through a deck", type: :feature do
  VCR.use_cassette "logged_in#user_goes_through_deck" do
    scenario "user can answer questions in a deck" do
      word_one, word_two = create_list(:deck_word, 2)
      word_one = word_one.word
      word_two = word_two.word
      nonincluded_word = create(:word)

      user = user_logs_in

      expect(page).to have_current_path flashcards_path

      # first word
      within("#flashcard-0-header") do
        expect(page).to have_content word_one.simp
      end

      within("#flashcard-0-question") do
        expect(page).to have_content "Select the correct pinyin"
      end

      within("#flashcard-0-choices") do
        expect(page).to have_content word_one.pinyin
        expect(page).not_to have_content word_one.definition
        choose("deck-word")
        click_link_or_button ("Next")
      end

      within("#flashcard-0-choices") do
        choose("other-deck-word-two")
        click_link_or_button ("Finish")
      end

      # score pops up, where score should be 1 out of 2 questions were correct
      within("#flash_score_popup") do
        expect(page).to have_content "Your score is 1"
      end

      # and when complete, will see a flash that says "Great work. You can try again!"
      # expect(page).to have_content "Great work. Keep at it!"
    end
  end
end

# find(:xpath, "(//input[@type='checkbox'])[25]")
