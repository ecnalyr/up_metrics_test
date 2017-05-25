require 'rails_helper'

RSpec.describe Participation, type: :model do
  before do
    @participation = FactoryGirl.create(:participation)
  end

  it { should validate_presence_of(:sport) }
  it { should validate_presence_of(:user) }

  it { should belong_to(:sport) }
  it { should belong_to(:user) }
end
