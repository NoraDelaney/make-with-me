require 'rails_helper'


feature "admin views users" do
# As an administrator of Make With Me
# I want to see a list of users and email addresses
# So that I can view who is using my website.
#
#
# Acceptance Criteria
# [ ] I can see a link to view a list of users from the homepage
# [ ] The page should contain the user's full name and email address.
# [ ] If I am not an administrator, I should be redirected to the homepage.

let(:admin) { FactoryGirl.create(:user, role: 'admin') }
let!(:user) { FactoryGirl.create(:user) }

  scenario 'admin visits users index' do
    login_as(admin)
    visit '/admin/users'
    expect(page).to have_content(user.email)
  end
end
