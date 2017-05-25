class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :participation_summary
  has_one :organization
  has_many :users
  #participation_summary
  # summary of all participations from all associated user's
end
