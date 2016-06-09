require 'rails_helper'

RSpec.describe "user goes through a deck", type: :feature do
  VCR.use_cassette "logged_in#user_goes_through_deck" do
    scenario "user can answer questions in a deck" do
      words = create_list(:word, 5)
      wrong_choices = WrongChoices.new
      
      user = user_logs_in

      expect(page).to have_current_path flashcards_path

      within("#flashcards") do
        expect(page).to have_content words.first.simp
        expect(page).to have_content "Select the correct pinyin"
      end

      within(".choice") do
        expect(page).to have_content words.first.pinyin
        expect(page).to have_content wrong_choices.first.pinyin
        expect(page).to have_content wrong_choices.last.pinyin
      end

    end
  end
end
