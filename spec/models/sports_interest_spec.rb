require 'rails_helper'

RSpec.describe SportsInterest, type: :model do
  before do
    @sport_interest = FactoryGirl.create(:sports_interest)
  end

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:sport) }

  it { should belong_to(:user) }
  it { should belong_to(:sport) }
end
