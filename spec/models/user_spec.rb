require 'rails_helper'

RSpec.describe User, type: :model do
  it "sets the rank to 25 right after being created" do
    user = User.create(name: "omgrr")

    expect(user.rank).to eq(25)
  end

  describe "#go_down" do
    it "decreases the rank by 1" do
      user = User.new(name: "omgrr")
      user.rank = 24
      user.go_down

      expect(user.rank).to eq(23)
    end

    it "doesn't let the rank go below 1" do
      user = User.new(name: "omgrr")
      user.rank = 1

      user.go_down

      expect(user.errors.messages[:rank]).to include("cannot go below 1")
    end
  end

  describe "#go_up" do
    it "increases the rank by 1" do
      user = User.new(name: "omgrr")
      user.rank = 24

      user.go_up

      expect(user.rank).to eq(25)
    end

    it "doesn't let the rank go past 25" do
      user = User.new(name: "omgrr", rank: "25")
      user.go_up

      expect(user.errors.messages[:rank]).to include("cannot go above 25")
    end

  end
end
