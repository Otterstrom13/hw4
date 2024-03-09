class PlacesController < ApplicationController
before_action :require_login
  
def index
  @user = current_user
  if @user
    @places = @user.places
    puts "Places: #{@places.inspect}"
  else
    flash[:error] = "You must be logged in to access this page."
    redirect_to login_path
  end
end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })
  end

  def new
    @user = User.find_by({ "id" => session["user_id"] })
  end

  def create
    @user = User.find_by(id: session["user_id"])
  
    if @user != nil
      @place = Place.new(name: params["name"])
      @place.save
      redirect_to "/places"
    else
      flash["notice"] = "Login first."
      redirect_to "/places"
    end
  end
  
  
end
