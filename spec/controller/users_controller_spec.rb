require 'rails_helper'

describe UsersController, type: :controller do
  context "when logged in" do
    before do
      @omgrr = User.create(name: "omgrr", email: "omgrr@ftp.com", password:"password123")
      sign_in(@omgrr)
    end

    it "lets you go up" do
      post :go_up, id: @omgrr.id
      expect(response.status).to eq(302)
    end

    it "lets you go down" do
      post :go_down, id: @omgrr.id
      expect(response.status).to eq(302)
    end

    it "doesn't let you rank up or down other users" do
      bison = User.create(name: "bison", email: "bison@ftp.com", password:"password123")

      post :go_up, id: bison.id
      expect(response.status).to eq(401)

      post :go_down, id: bison.id
      expect(response.status).to eq(401)

      expect(bison.reload.rank).to eq(25)
    end
  end
end
