class StudySessionSerializer < ActiveModel::Serializer
  attributes :id, :score, :user_deck_id, :date
end
