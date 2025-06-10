class TracksController < ApplicationController
  def index
    if params[:album_id]
      @tracks = Track.where(album_id: params[:album_id])
    else
      @tracks = Track.all
    end
  end
end
