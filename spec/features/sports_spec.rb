require 'rails_helper'

feature 'Sports', js: true do
  scenario 'display angular page' do
    visit '/'
    expect(page).to have_content('app works!')
  end
end
