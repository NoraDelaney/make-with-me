require 'rails_helper'

feature "User searches for a match" do

# As a signed in user
# I want to search for a match
# So that I can create something with someone.
#
#
# Acceptance Criteria
# [ ] If I enter valid search information, I should see a list of matches.
# [ ] If I do not enter valid search information, I should see an error message
# and remain on the page.

  before(:each) do
    FactoryGirl.create(:user, username: 'Jean', description: 'poetry')
  end

  scenario 'valid search' do
    visit users_path
    fill_in :q, with: 'poe'
    click_button 'Search'

    expect(page).to have_content('Jean')
    expect(page).to_not have_content('Please specify a search phrase')
  end

  scenario 'no valid search parameter specified' do
    visit users_path
    click_button 'Search'

    expect(page).to have_content('Please specify a search phrase')
  end
end
