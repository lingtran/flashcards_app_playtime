class AddColumnToStudySessions < ActiveRecord::Migration
  def change
    add_column :study_sessions, :weight, :integer
  end
end
