class RenameDictsToWords < ActiveRecord::Migration
  def change
    rename_table :dicts, :words
  end
end
