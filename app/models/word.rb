class Word < ActiveRecord::Base
  validates :trad, presence: true
  validates :simp, presence: true
  validates :pinyin, presence: true
  validates :definition, presence: true
end
