class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  validates_presence_of :user
  validates_presence_of :sport

  scope :recent_participations, -> { where('date > ?', DateTime.now - 2.weeks) }
end
