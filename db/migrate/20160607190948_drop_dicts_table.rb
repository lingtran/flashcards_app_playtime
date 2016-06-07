class DropDictsTable < ActiveRecord::Migration
  def change
      drop_table :dicts
  end
end
