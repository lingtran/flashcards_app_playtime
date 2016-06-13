class RemoveAverageDeckScoreAndMasteryLevelColumnsFromUserDecks < ActiveRecord::Migration
  def change
    remove_column :user_decks, :average_deck_score
    remove_column :user_decks, :mastery_level
  end
end
