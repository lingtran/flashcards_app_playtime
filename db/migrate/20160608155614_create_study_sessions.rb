class CreateStudySessions < ActiveRecord::Migration
  def change
    create_table :study_sessions do |t|
      t.references :user_deck, index: true, foreign_key: true
      t.integer :score
      t.datetime :date

      t.timestamps null: false
    end
  end
end
