class AddImageLinkColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :graph, :string
  end
end
