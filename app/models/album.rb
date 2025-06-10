class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
end
