require 'rails_helper'

RSpec.describe 'Consumer Views User Participation', :type => :request do
  before do
    @user1 = FactoryGirl.create(:user, :with_recent_participation, :with_old_participation)
    @user2 = FactoryGirl.create(:user, :with_recent_participation, :with_old_participation)
  end

  it 'lists user participation over the past week' do
    get "/api/consumer/users/#{@user1.id}/participations"

    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:success)

    expect(JSON.parse(response.body).count).to eq(1)
    expect(JSON.parse(response.body).first['duration_minutes']).to eq(10)
    expect(JSON.parse(response.body).first['date']).to be_present
    expect(JSON.parse(response.body).first['sport']).to be_present
  end
end
