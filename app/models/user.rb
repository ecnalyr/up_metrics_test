class User < ApplicationRecord
  has_many :sports_interests

  validates :email, presence: true, uniqueness: true
end
