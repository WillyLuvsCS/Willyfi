class Track < ApplicationRecord
  belongs_to :album
  belongs_to :artist

  before_validation :set_artist_from_album, on: :create

  private

  def set_artist_from_album
    self.artist_id = album&.artist_id if album
  end

  validates :title, presence: true
  validates :duration_ms, presence: true
  validates :file_url, presence: true
end