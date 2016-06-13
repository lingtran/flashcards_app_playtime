class RemoveMasteryLevelColumnFromUserDecks < ActiveRecord::Migration
  def change
    remove_column :user_decks, :mastery_level
  end
end
