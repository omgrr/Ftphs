class UsersController < ApplicationController
  def go_down
    user = User.find(params[:id])
    user.go_down

    if user.valid?
      flash[:success] = "Rank down"
    else
      flash[:error] = user.errors.full_messages.join("\n")
    end

    redirect_to home_path
  end

  def go_up
    user = User.find(params[:id])
    user.go_up

    if user.valid?
      flash[:success] = "Rank up"
    else
      flash[:error] = user.errors.full_messages.join("\n")
    end

    redirect_to home_path
  end
end
