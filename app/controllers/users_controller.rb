class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Thanks for signing up. Now login."
      redirect_to "/login"
    else
      render :new
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end

#I attempted to do this following the method we used in class, but kept getting an error
#So Chat GPT gave me an alternative way to do it
