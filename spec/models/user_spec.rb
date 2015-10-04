require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#go_down" do
    it "should decrease the rank by 1" do
      user = User.new(name: "omgrr", rank: "24")
      user.go_down

      expect(user.rank).to eq(23)
    end
  end

  describe "#go_up" do
    it "should increase the rank by 1" do
      user = User.new(name: "omgrr", rank: "24")
      user.go_up

      expect(user.rank).to eq(25)
    end

  end
end
