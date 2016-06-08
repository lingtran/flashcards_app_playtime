class StudySession < ActiveRecord::Base
  belongs_to :user_deck

  validates :score, presence: true
  validates :date, presence: true
end
