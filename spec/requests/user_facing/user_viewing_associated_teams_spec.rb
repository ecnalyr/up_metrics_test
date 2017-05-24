require 'rails_helper'

RSpec.describe 'User Viewing Associated Teams', :type => :request do
  before do
    @team = FactoryGirl.create(:team, :with_users, users_count: 2)
    @user1 = FactoryGirl.create(:user, teams: [@team])
    @user2 = FactoryGirl.create(:user, :with_teams, teams_count: 2)
  end

  it 'lists all teams for a user' do
    get "/api/users/#{@user1.id}/teams"

    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:success)

    expect(JSON.parse(response.body).count).to eq(1) # Only the user's team
    expect(JSON.parse(response.body).first['name']).to include('team')
    expect(JSON.parse(response.body).first['users'].count).to eq(3) # Two users from factory, plus this user
  end
end
