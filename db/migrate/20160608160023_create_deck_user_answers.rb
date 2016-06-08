class CreateDeckUserAnswers < ActiveRecord::Migration
  def change
    create_table :deck_user_answers do |t|
      t.references :deck_word_question_choice, index: true, foreign_key: true
      t.references :deck_word_question, index: true, foreign_key: true
      t.references :study_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
