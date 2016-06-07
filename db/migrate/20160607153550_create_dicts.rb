class CreateDicts < ActiveRecord::Migration
  def change
    create_table :dicts do |t|
      t.text :trad
      t.text :simp
      t.text :pinyin
      t.text :definition

      t.timestamps null: false
    end
  end
end
