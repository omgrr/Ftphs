class UsersController < ApplicationController
  def rank_up
    user = User.find(params[:id]).rank_up

    redirect_to home_path
  end

  def rank_down
    user = User.find(params[:id]).rank_down

    redirect_to home_path
  end
end
