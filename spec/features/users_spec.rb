require 'rails_helper'

feature 'Users', js: true do
  before do
    @user = FactoryGirl.create(
      :user,
      email: 'example@example.com',
      first_name: 'John'
    )
  end

  scenario 'display list of users' do
    visit '/'
    expect(page).to have_content('example@example.com')
  end

  scenario 'view user details' do
    visit '/'
    find('.user', text: 'example@example.com').click

    expect(page).to have_text('John')
  end

  scenario 'new user' do
    visit '/'
    click_link 'New User'

    fill_in 'Email', with: 'foo@bar.com'
    click_button 'Save'

    expect(page).to have_text('foo@bar.com')
  end

  scenario 'edit user' do
    skip
    visit '/' # TODO: Change to a specific user's route

    fill_in 'First Name', with: 'Updated Name'
    click_button 'Save'

    expect(page).to have_text('Updated Name')
  end
end
