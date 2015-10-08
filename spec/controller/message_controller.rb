require 'rails_helper'

describe MessagesController, type: :controller do
  context "when logged in" do
    before do
      @omgrr = User.create(name: "omgrr", email: "omgrr@ftp.com", password: "password123")
      sign_in(@omgrr)
    end

    it "response with 302 and creates a message" do
      post :create, message: "Hello World"

      expect(response.status).to eq(302)
      expect(Message.where(body: "Hello World").size).to eq(1)
    end
  end

  context "when not logged in" do
    it "response with 401 and does not create a message" do
      post :create, message: "Hello World"

      expect(response.status).to eq(401)
      expect(Message.where(body: "Hello World").size).to eq(0)
    end
  end
end
