require 'rails_helper'

RSpec.describe 'User Sport Interests', :type => :request do
  @user = FactoryGirl.create(:user, :with_sports_interests)

  it 'lists all sports interests for a user' do
    get '/users/sports_interests'

    # make sure things are working as expected
    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:created)

    # check that response has the appropriate content
    expect(response.body).to include("several sports")
  end
end
