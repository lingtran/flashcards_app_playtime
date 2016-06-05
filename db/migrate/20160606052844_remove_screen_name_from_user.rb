class RemoveScreenNameFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :screen_name, :string
  end
end
