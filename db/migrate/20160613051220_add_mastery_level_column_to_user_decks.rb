class AddMasteryLevelColumnToUserDecks < ActiveRecord::Migration
  def change
    add_column :user_decks, :mastery_level, :integer
  end
end
