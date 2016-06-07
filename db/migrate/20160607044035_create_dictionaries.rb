class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.text :traditional
      t.text :simplified
      t.text :pinyin
      t.text :definition

      t.timestamps null: false
    end
  end
end
