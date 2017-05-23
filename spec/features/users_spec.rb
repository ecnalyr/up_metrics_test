require 'rails_helper'

feature 'Users', js: true do
  before do
    FactoryGirl.create(:user, email: 'example@example.com')
  end

  scenario 'display list of users' do
    visit '/'
    expect(page).to have_content('example@example.com')
  end
end
