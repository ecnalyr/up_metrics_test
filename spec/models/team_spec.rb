require 'rails_helper'

RSpec.describe Team, type: :model do
  before do
    @team = FactoryGirl.create(:team)
  end

  it { should validate_presence_of(:name) }

  it { should belong_to(:organization)}
  it { should have_and_belong_to_many(:users) }

  describe '#participation_summary' do
    context 'associated users have no participations' do
      let(:subject) { FactoryGirl.create(:team, :with_users) }

      it 'returns zero participations' do
        expect(subject.participation_summary.count).to eq(0)
      end
    end

    context 'associated users have participations' do
      let(:subject) { FactoryGirl.create(:team, :with_busy_users) }


      it 'returns a summary of participation by associated users' do
        # There are 4 total participations, but only 2 'recent_participations'
        expect(subject.participation_summary.count).to eq(2)
        expect(subject.participation_summary.first.sport_name).to include('sport')
        expect(subject.participation_summary.first.duration_minutes).to eq(10)
      end
    end
  end
end
