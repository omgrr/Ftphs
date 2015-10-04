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

  it "shows each user" do
    omgrr = User.create(name: "omgrr", rank: 25)
    bison = User.create(name: "bison", rank: 25)

    visit "/"

    expect(page).to have_selector(".user##{omgrr.id}")
    expect(page).to have_selector(".user##{bison.id}")
  end
end
