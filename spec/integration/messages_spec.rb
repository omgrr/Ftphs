require 'rails_helper'

describe "messages", :type => :feature do
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
