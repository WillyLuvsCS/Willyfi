class GenresController < ApplicationController
  def index
    @genres = Artist.distinct.pluck(:genre).sort
  end
end