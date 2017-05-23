class Sport < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true
end
