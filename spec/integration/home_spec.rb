require 'rails_helper'

describe "the home page", :type => :feature do
  it "has the title 'Free to Play Hearthstone Tracker'" do
    visit "/home"
    expect(page).to have_title("Free to Play Hearthstone Tracker")
  end

  it "sets the root to the home controller" do
    visit "/"
    expect(page).to have_title("Free to Play Hearthstone Tracker")
  end

  context "when your not logged in" do
    it "has a 'New User' link" do
      visit "/"
      expect(page).to have_link("Log In")
    end

    it "has a 'Log In' link" do
      visit "/"
      expect(page).to have_link("New User")
    end
  end

  context "when you are logged in" do
    it "displays the `Log Out` link" do
      user = User.create(name: "omgrr", email: "omgrr@ftp.com", password: "password123")
      sign_in(user)
      visit "/"

      expect(page).to have_link("Log Out")
      expect(page).to_not have_link("New User")
    end
  end
end
