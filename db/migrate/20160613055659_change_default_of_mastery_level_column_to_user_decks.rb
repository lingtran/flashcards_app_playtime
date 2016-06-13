class ChangeDefaultOfMasteryLevelColumnToUserDecks < ActiveRecord::Migration
  def change
    change_column_default :user_decks, :mastery_level, from: 0, to: 1
  end
end
