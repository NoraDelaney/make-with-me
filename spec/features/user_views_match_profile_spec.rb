require 'rails_helper'

feature "user views match profile" do
# As a signed-in user
# I want to see the details of a match
# So that I can decide if I want to collaborate with them
#
#
# Acceptance Criteria
# [ ] From the search results index page, I should be able to click on a link
# for a match.
# [ ] I should see the match’s profile, including description, username, first
# first name, city, state, and last name.

  scenario 'valid search' do
    visit users_path
    fill_in :q, with: 'poe'
    click_button 'Search'

    click_link ('Jean')
    expect(page).to_have_content(user.username)
    expect(page).to_have_content(user.description)
    expect(page).to_have_content(user.last_name)
    expect(page).to_have_content(user.first_name)
    expect(page).to_have_content(user.city)
    expect(page).to_have_content(user.state)
  end
end
