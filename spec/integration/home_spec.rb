require 'rails_helper'

describe "the home page" do
  it "has the title 'Free to Play Hearthstone Tracker'" do
    response = get "/"

    expect(response.body.title).to eq("Free to Play Hearthstone Tracker")
  end
end
