require 'rails_helper'

feature "User edits profile" do
# As a signed-in user
# I want to edit my profile page
# So that the information is up to date.
#
#
# Acceptance Criteria
# [ ] If I enter valid information, I am told that my profile has been updated
# [ ] If I do not enter valid information, I am given an error message and
# brought back to the edit form.




scenario "user enters valid information and edits profile" do

  user = FactoryGirl.create(:user)

  visit new_user_session_path

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password

  click_button "Log in"

  click_link user.username

  click_link "Edit Profile"

  fill_in "First name", with: "BANANA!!"

  click_button "Edit Profile"

  expect(page).to have_content("User updated.")
  expect(page).to have_content("BANANA!!")
end

scenario "user enters invalid information" do

user = FactoryGirl.create(:user)

  visit new_user_session_path

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password

  click_button "Log in"

  click_link user.username

  click_link "Edit Profile"
  
  fill_in "First name", with: ""

  click_button "Edit Profile"

  expect(page).to have_content("First name can't be blank")
  expect(page).to have_content("Edit your profile and describe yourself and your art.")
end


end
