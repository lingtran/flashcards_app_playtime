class AddPrimaryKeyToDict < ActiveRecord::Migration
  def change
    add_column :dict, :id, :primary_key
  end
end
