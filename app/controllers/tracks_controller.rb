class TracksController < ApplicationController

  before_action :set_track, only: [:upload_audio]

  def index
    if params[:album_id]
      @tracks = Track.where(album_id: params[:album_id])
    else
      @tracks = Track.all
    end
  end

  def upload_audio
  @track = Track.find(params[:id])

  uploaded_file = params.dig(:track, :audio_file) || params[:audio_file]

  if uploaded_file.present?
    @track.audio_file.attach(uploaded_file)
    flash[:notice] = "Audio uploaded for '#{@track.title}'"
  else
    flash[:alert] = "No audio file selected."
  end

  redirect_to tracks_path(album_id: @track.album_id)
end



  private

  def set_track 
    @track = Track.find(params[:id])
  end
end
 