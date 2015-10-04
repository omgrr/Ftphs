require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#rank_up" do
    it "should increase the rank by 1" do
      user = User.new(name: "omgrr", rank: "25")
      user.rank_up

      expect(user.rank).to eq(24)
    end
  end

  describe "#rank_down" do

  end
end
