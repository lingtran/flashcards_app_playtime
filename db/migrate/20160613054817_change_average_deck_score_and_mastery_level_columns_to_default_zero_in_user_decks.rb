class ChangeAverageDeckScoreAndMasteryLevelColumnsToDefaultZeroInUserDecks < ActiveRecord::Migration
  def change
    change_column_default :user_decks, :average_deck_score, default: 0
    change_column_default :user_decks, :mastery_level, default: 0
  end
end
