class SportsInterest < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  validates_presence_of :user
  validates_presence_of :sport
end
