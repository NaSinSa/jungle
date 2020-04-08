require 'rails_helper'

RSpec.feature "Member can login", type: :feature do
  # SETUP
  before :each do
    @user = User.create!(
      first_name:  'iam',
      last_name: 'auser',
      email: 'eadd',
      password: 'aaa',
      password_confirmation: 'aaa',
      id: 1
    )
  end

  scenario "They login and are taken to home page" do
    # ACT
    visit '/login'
    fill_in 'email', with: 'eadd'
    fill_in 'password', with: 'aaa'
    click_on 'Submit'

    # DEBUG
    # save_screenshot

    # VERIFY
    expect(page).to have_content 'Hi eadd!'
    # puts page.html

  end
end