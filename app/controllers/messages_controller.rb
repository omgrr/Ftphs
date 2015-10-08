class MessagesController < ApplicationController
  def create
    if current_user
      message = Message.create(username: current_user.name, body: params[:message])

      redirect_to home_path
    else
      redirect_to home_path, status: :unauthorized
    end
  end
end
