require 'rails_helper'

RSpec.describe WrongChoices, type: :model do
  context "#option_one" do
    it "can generate randomly selected words from Words table to serve as decoy answer choices" do
      quizzed_word = create(:deck_question_word).word.simp
      create_list(:decoys, 5)
      decoys = WrongChoices.options_for(quizzed_word)

      expect(decoys.count).to eq(2)
      expect(decoys.first.simp).not_to eq(quizzed_word)
    end
  end
end
