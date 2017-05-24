class ParticipationSerializer < ActiveModel::Serializer
  attributes :id, :date, :duration_minutes
  has_one :user
  has_one :sport
end
