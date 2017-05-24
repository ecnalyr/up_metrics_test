require 'rails_helper'

RSpec.describe Team, type: :model do
  before do
    @team = FactoryGirl.create(:team)
  end

  it { should validate_presence_of(:name) }
  it { should belong_to(:organization)}
end
