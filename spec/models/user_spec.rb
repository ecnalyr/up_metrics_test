require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe 'email' do
    it 'should be present' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    context 'not unique' do
      it 'should not be valid' do
        non_unique_user = @user.dup
        expect(non_unique_user).not_to be_valid
      end
    end
  end
end
