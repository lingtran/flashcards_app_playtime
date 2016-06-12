require 'rails_helper'

RSpec.describe "user can choose a deck", type: :feature do
  VCR.use_cassette "logged_in#user_chooses_a_deck" do
    scenario "user can choose a deck upon logging in" do
    deck_one = create(:deck)
    deck_two = create(:deck, :definition_deck)
    create(:question)
    question_two = create(:question, :definition_question)
    deck_question_one = create(:deck_question_word)
    deck_question_two = create(:deck_question_word, deck_id: deck_two.id, question_id: question_two.id)

    user = set_user

    visit root_path
    click_link "Sign in with Facebook"

    expect(page).to have_content deck_question_one.deck.name
    expect(page).to have_content deck_question_two.deck.name
    click_link "#{deck_question_one.deck.name}"

    expect(page).to have_current_path flashcard_user_path(user, deck_question_one.deck.id)
    end
  end
end
