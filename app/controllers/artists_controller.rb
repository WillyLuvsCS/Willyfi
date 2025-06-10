class ArtistsController < ApplicationController
  def index
    if params[:genre]
      @artists = Artist.where("genre LIKE ?", "%#{params[:genre]}%")
    else
      @artists = Artist.all
    end
  end
end