require 'rails_helper'

describe "the home page", :type => :feature do
  describe "users" do
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
      expect(page).to have_selector(".user##{omgrr.id} .rank_20")
      expect(find(".user##{bison.id}")).to have_content("bison")
      expect(page).to have_selector(".user##{bison.id} .rank_25")
    end

    it "lets you 'go down' and displays the correct spite" do
      omgrr = User.create(name: "omgrr", rank: 20)

      visit "/"

      within(".user##{omgrr.id}") do
        click_button("Go Down")
      end

      expect(omgrr.reload.rank).to eq(19)
      expect(page).to have_selector(".user##{omgrr.id} .rank_19")
    end

    it "lets you 'go up' and displays the correct spite" do
      omgrr = User.create(name: "omgrr", rank: 20)

      visit "/"

      within(".user##{omgrr.id}") do
        click_button("Go Up")
      end

      expect(omgrr.reload.rank).to eq(21)
      expect(page).to have_selector(".user##{omgrr.id} .rank_21")
    end
  end

  describe "messages" do
    it "shows all of the posted messages" do
      [1,2,3].each do |i|
        Message.create(username: "omgrr", body: "Hello #{i}")
      end

      visit "/"

      expect(page).to have_content("omgrr: Hello 1")
      expect(page).to have_content("omgrr: Hello 2")
      expect(page).to have_content("omgrr: Hello 3")
    end
  end
end
