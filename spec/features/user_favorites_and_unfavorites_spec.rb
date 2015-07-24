require 'rails_helper'

feature "User favorites and unfavorites" do
  # As a signed-in user
  # I want to favorite and unfavorite other users' profiles.
  #
  #
  # Acceptance Criteria
  # [ ] If I favorite another user's profile, the favorite count increments
  # and I see a link to "Undo". The favorited user is sent email notification.
  # [ ] If I unfavorite another user's profile, the favorite count decrements
  # and I see a link to "Favorite".

  scenario "user favorites another profile and revokes favorite", js: true do
    ActionMailer::Base.deliveries.clear

    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    visit user_path(user2)

    click_link "Favorite"

    expect(page).to have_content("Undo")
    expect(page).to have_content("1 favorites.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)

    click_link "Undo"

    expect(page).to have_content("Favorite")
    expect(page).to have_content("0 favorites.")
  end
end
