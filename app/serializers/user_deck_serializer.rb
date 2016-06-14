class UserDeckSerializer < ActiveModel::Serializer
  attributes :user_name, :average_deck_score, :study_rate_per_week, :level

  def level
    names = ["Novice", "Badass-in-Training", "Badass"]
    if object.mastery_level <= 1
      names[0]
    elsif object.mastery_level == 3
      names[2]
    else
      names[1]
    end
  end

  def user_name
    object.user.name.split.first
  end
end
