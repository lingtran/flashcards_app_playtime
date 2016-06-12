require 'rails_helper'

RSpec.describe "oauth login", type: :feature do
  VCR.use_cassette "omniauth_login" do
    scenario "user can log in with Facebook account" do
      deck_one, deck_two = create_list(:deck, 2)
      user = set_user

      visit root_path
      click_link "Sign in with Facebook"

      expect(page).to have_current_path flashcards_user_path(user)
      expect(page).to have_content "#{deck_one.name}"
      expect(page).to have_content "#{deck_two.name}"
      expect(page).to have_content user.name
      expect(page).to have_link "Log Out"

      visit root_path

      expect(page).to have_current_path flashcards_user_path(user)
    end
  end
end
