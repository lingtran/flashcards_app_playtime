class AddFocusAreaToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :focus_area, :integer, default: 0
  end
end
