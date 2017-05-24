require 'rails_helper'

RSpec.describe Sport, type: :model do
  before do
    @sport = FactoryGirl.create(:sport)
  end

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:icon) }
end
