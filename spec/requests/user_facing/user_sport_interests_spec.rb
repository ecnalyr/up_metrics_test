require 'rails_helper'

RSpec.describe 'User Sport Interests', :type => :request do
  before do
    @user1 = FactoryGirl.create(:user, :with_sports_interests, sports_interests_count: 2)
    @user2 = FactoryGirl.create(:user, :with_sports_interests, sports_interests_count: 2)
  end

  it 'lists all sports interests for a user' do
    get "/api/users/#{@user1.id}/sports_interests"

    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:success)

    expect(JSON.parse(response.body).count).to eq(2)
    expect(JSON.parse(response.body).first['sport']['icon']).to include('icon_url')
    expect(JSON.parse(response.body).first['sport']['name']).to include('sport')
  end
end
