class AddArtistToTracks < ActiveRecord::Migration[7.0]
  def up
    # Add artist_id column, allow NULL, with foreign key
    add_reference :tracks, :artist, foreign_key: true

    # Backfill artist_id for existing tracks based on album's artist
    Track.find_each do |track|
      track.update(artist_id: track.album&.artist_id) if track.album
    end

    # Enforce NOT NULL after backfilling
    change_column_null :tracks, :artist_id, false
  end

  def down
    remove_reference :tracks, :artist
  end
end