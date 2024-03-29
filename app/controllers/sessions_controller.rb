class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params["email"])

    if @user && @user.authenticate(params["password"])
      session["user_id"] = @user.id
      flash["notice"] = "Hello, #{@user.first_name}!"
      redirect_to "/places"
    else
      flash["notice"] = "Invalid email or password."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end



  