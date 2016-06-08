class CreateDeckWordQuestions < ActiveRecord::Migration
  def change
    create_table :deck_word_questions do |t|
      t.references :deck_word, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
