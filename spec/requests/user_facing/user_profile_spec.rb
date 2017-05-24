require 'rails_helper'

RSpec.describe 'User Sport Interests', :type => :request do
  before do
    @user = FactoryGirl.create(:user, :with_public_profile)
  end

  it 'lists profile information for a user' do
    get "/api/users/#{@user.id}"

    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:success)

    expect(JSON.parse(response.body)['email']).to include('@example.com')
    expect(JSON.parse(response.body)['first_name']).to eq('John')
    expect(JSON.parse(response.body)['last_name']).to eq('Doe')
    expect(JSON.parse(response.body)['height_inches']).to eq(72)
    expect(JSON.parse(response.body)['weight_pounds']).to eq(185)
    expect(JSON.parse(response.body)['private_profile']).to eq(false)
  end
end
