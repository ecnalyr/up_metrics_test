class User < ApplicationRecord
  has_many :sports_interests
  has_and_belongs_to_many :teams

  validates :email, presence: true, uniqueness: true
end
