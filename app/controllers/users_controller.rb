class UsersController < ApplicationController
  def go_down
    user = User.find(params[:id]).go_down

    redirect_to home_path
  end

  def go_up
    user = User.find(params[:id]).go_up

    redirect_to home_path
  end
end
