class AddLevelAndIsCorrectToDeckQuestionWords < ActiveRecord::Migration
  def change
    add_column :deck_question_words, :is_correct, :integer, default: 0
    add_column :deck_question_words, :level, :integer, default: 0
  end
end
