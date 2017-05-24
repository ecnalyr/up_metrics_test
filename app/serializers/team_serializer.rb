class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :organization
  has_many :users
end
