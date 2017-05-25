class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  validates_presence_of :user
  validates_presence_of :sport

  delegate :name, to: :sport
  alias :sport_name :name

  scope :recent_participations, -> { where('date > ?', DateTime.now - 1.week) }
end
