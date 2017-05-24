require 'rails_helper'

RSpec.describe 'Organization views teams', :type => :request do
  before do
    @organization1 = FactoryGirl.create(:organization, :with_teams)
    @organization2 = FactoryGirl.create(:organization, :with_teams)
  end

  it 'lists only the teams that belong to the organization' do
    get "/api/organizations/#{@organization1.id}/teams"

    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:success)

    expect(JSON.parse(response.body).count).to eq(2)
    expect(JSON.parse(response.body).first['name']).to include('team')
  end
end
