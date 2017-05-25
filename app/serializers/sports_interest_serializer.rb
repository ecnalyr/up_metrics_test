class SportsInterestSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :sport
end
