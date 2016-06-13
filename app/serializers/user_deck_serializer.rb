class UserDeckSerializer < ActiveModel::Serializer
  attributes :user_id, :average_deck_score, :study_rate_per_week, :mastery_level
end
