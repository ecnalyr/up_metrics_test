require 'rails_helper'

RSpec.describe Sport, type: :model do
  before do
    @sport = FactoryGirl.create(:sport)
  end

  describe 'name' do
    it 'should be present' do
      @sport.name = nil
      expect(@sport).not_to be_valid
    end

    context 'not unique' do
      it 'should not be valid' do
        non_unique_sport = @sport.dup
        expect(non_unique_sport).not_to be_valid
      end
    end
  end

  describe 'icon' do
    it 'should be present' do
      @sport.icon = nil
      expect(@sport).not_to be_valid
    end
  end
end
