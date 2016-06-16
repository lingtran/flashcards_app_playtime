class ChangeStudyRatePerWeekToDecimalToUserDecks < ActiveRecord::Migration
  def change
    change_column :user_decks, :study_rate_per_week, :decimal, precision: 10, scale: 3
  end
end
