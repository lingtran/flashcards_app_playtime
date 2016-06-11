class CreateDeckQuestionsWords < ActiveRecord::Migration
  def change
    create_table :deck_questions_words do |t|
      t.references :question, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true
      t.references :deck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
