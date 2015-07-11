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
    FactoryGirl.create(:user, description: 'poetry')
  end

  scenario 'valid search' do
    visit users_path
    fill_in 'Search', with: 'poe'
    click_button 'Submit'

    expect(page).to have_content('poetry')
    expect(page).to_not have_content('writing')
  end

  scenario 'no valid search parameter specified' do
    visit users_path
    click_button 'Submit'

    expect(page).to have_content('Please specify a search phrase')
  end
end
