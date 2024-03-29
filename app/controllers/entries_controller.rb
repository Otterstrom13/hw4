class EntriesController < ApplicationController

  def new
  end
  
  def create
    @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry.uploaded_image.attach(params["uploaded_image"])
      @entry["user_id"] = @user["id"]
      
      place_id = params["place_id"]
      @entry.place_id = place_id if Place.exists?(place_id)
      @entry.save
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/places"
  end

end