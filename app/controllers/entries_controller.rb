class EntriesController < ApplicationController

  def new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.save

    redirect_to place_path(@entry.place_id)
  end

  private

  def entry_params
    params.permit(:title, :description, :occurred_on, :place_id, :image)
  end

end
