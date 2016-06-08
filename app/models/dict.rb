class Dict < ActiveRecord::Base
  validates :trad, presence: true
  validates :simp, presence: true
  validates :pinyin, presence: true
  validates :definition, presence: true
  
  self.pluralize_table_names = false
end
