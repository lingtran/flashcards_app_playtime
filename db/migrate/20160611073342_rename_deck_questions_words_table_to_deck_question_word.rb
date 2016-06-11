class RenameDeckQuestionsWordsTableToDeckQuestionWord < ActiveRecord::Migration
  def change
    rename_table :deck_questions_words, :deck_question_words
  end
end
