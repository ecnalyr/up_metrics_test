class Team < ApplicationRecord
  validates :name, presence: true
  belongs_to :organization
  has_and_belongs_to_many :users
  has_many :participations, through: :users

  # a summary of recent (< 1 week old) SportParticipations by Users
  def participation_summary
    participations.recent_participations
  end
end
