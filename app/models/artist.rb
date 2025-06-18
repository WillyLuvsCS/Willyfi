class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy

  validates :name, presence: true
  validates :genre, presence: true, allow_blank: false 

  def genre_list
    genre.to_s.split(",").map(&:strip).uniq
  end
end
