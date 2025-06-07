class Track < ApplicationRecord
  belongs_to :album
  has_many :playlist_tracks, dependent: :destroy
  has_many :playlists, through: :playlist_tracks

  validates :title, presence: true
  validates :duration_ms, presence: true
  validates :file_url, presence: true
end
