require 'rails_helper'

RSpec.describe Organization, type: :model do
  before do
    @organization = FactoryGirl.create(:organization)
  end

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
