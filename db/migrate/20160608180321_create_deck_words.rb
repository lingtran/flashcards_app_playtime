class CreateDeckWords < ActiveRecord::Migration
  def change
    create_table :deck_words do |t|
      t.references :deck, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
