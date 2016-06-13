class AddAverageDeckScoreAndStudyRatePerWeekColumnsToUserDecks < ActiveRecord::Migration
  def change
    add_column :user_decks, :average_deck_score, :integer
    add_column :user_decks, :study_rate_per_week, :integer
  end
end
