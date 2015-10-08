require 'rails_helper'

describe "messages", :type => :feature do
  context "when logged in" do
    before do
      @omgrr = User.create(name: "omgrr", email: "omgrr@ftp.com", password: "password123")
      sign_in(@omgrr)
    end

    it "shows all of the posted messages" do
      [1,2].each do |i|
        Message.create(username: "omgrr", body: "Hello #{i}")
      end

      visit "/"

      expect(page).to have_content("Hello 1")
      expect(page).to have_content("Hello 2")
    end

    it "lets you post messages" do
      page.find("textarea#message").set("Hello world 1")
      click_button("Submit")

      expect(page).to have_content("Hello world 1")
    end
  end

  context "when not logged in" do
    it "doesn't show the messages or form" do
      visit "/"
      [1,2,3].each do |i|
        Message.create(username: "omgrr", body: "Hello #{i}")
      end

      visit "/"

      expect(page).to_not have_content("Hello 1")
      expect(page).to_not have_content("Hello 2")
      expect(page).to_not have_content("Hello 3")
      expect(page).to_not have_selector("#message_form")
    end
  end
end
