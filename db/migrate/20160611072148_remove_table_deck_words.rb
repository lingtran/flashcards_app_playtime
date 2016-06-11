class RemoveTableDeckWords < ActiveRecord::Migration
  def change
    drop_table :deck_words
  end
end
