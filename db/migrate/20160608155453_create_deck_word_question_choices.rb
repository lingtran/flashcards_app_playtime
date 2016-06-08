class CreateDeckWordQuestionChoices < ActiveRecord::Migration
  def change
    create_table :deck_word_question_choices do |t|
      t.references :deck_word_question, index: true, foreign_key: true
      t.text :name
      t.boolean :is_correct

      t.timestamps null: false
    end
  end
end
