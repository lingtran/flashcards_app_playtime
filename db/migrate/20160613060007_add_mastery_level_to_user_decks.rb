class AddMasteryLevelToUserDecks < ActiveRecord::Migration
  def change
    add_column :user_decks, :mastery_level, :integer, default: 1
  end
end
