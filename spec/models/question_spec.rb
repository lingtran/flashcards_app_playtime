require 'rails_helper'

RSpec.describe Question, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "associations" do
    it { should have_many(:deck_question_words) }
    it { should have_many(:words).through(:deck_question_words) }
    it { should have_many(:decks).through(:deck_question_words) }
  end
end
