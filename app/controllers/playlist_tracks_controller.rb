class PlaylistTracksController < ApplicationController
	def index
    	@playlist_tracks = Playlist_Track.all
    end
end
