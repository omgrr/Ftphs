class UsersController < ApplicationController
  def go_down
    user = User.find(params[:id])

    if user != current_user
      redirect_to(home_path, status: :unauthorized)
    else
      user.go_down

      if user.valid? and current_user == user
        flash[:success] = "Rank down"
      else
        flash[:error] = user.errors.full_messages.join("\n")
      end

      redirect_to home_path
    end

  end

  def go_up
    user = User.find(params[:id])

    if user != current_user
      redirect_to(home_path, status: :unauthorized)
    else
      user.go_up

      if user.valid? and current_user == user
        flash[:success] = "Rank up"
      else
        flash[:error] = user.errors.full_messages.join("\n")
      end

      redirect_to home_path
    end
  end
end
