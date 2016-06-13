class AddScoreAndMasterColumnsToUserDecks < ActiveRecord::Migration
  def change
    add_column :user_decks, :average_deck_score, :integer, default: 0
    add_column :user_decks, :mastery_level, :integer, default: 0
  end
end
