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

  it "displays the users name and rank" do
    omgrr = User.create(name: "omgrr", rank: 20)
    bison = User.create(name: "bison", rank: 25)

    visit "/"

    expect(find(".user##{omgrr.id}")).to have_content("omgrr")
    expect(find(".user##{omgrr.id}")).to have_content("20")
    expect(find(".user##{bison.id}")).to have_content("bison")
    expect(find(".user##{bison.id}")).to have_content("25")
  end
end
