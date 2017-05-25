class ParticipationSerializer < ActiveModel::Serializer
  attributes :id, :date, :duration_minutes, :sport_name
  has_one :user
  has_one :sport
end
