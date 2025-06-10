# db/seeds.rb
require 'faker'

# Clear existing data to avoid duplicates (optional, comment out if not needed)
Artist.destroy_all

# Create The Beatles artist
artist = Artist.create!(
  name: "The Beatles",
  genre: "Rock",
  profile_image: Faker::Internet.url(host: 'example.com', path: '/images/beatles_profile.jpg')
)

# Create Abbey Road album
album = artist.albums.create!(
  title: "Abbey Road",
  cover_image: Faker::Internet.url(host: 'example.com', path: '/images/abbey_road_cover.jpg'),
  image_url: Faker::Internet.url(host: 'example.com', path: '/images/abbey_road.jpg')
)

# Create tracks for Abbey Road
tracks = [
  { title: "Come Together", duration_ms: 259_000 },
  { title: "Something", duration_ms: 182_000 },
  { title: "Maxwell's Silver Hammer", duration_ms: 207_000 },
  { title: "Oh! Darling", duration_ms: 207_000 },
  { title: "Octopus's Garden", duration_ms: 170_000 },
  { title: "I Want You (She's So Heavy)", duration_ms: 467_000 },
  { title: "Here Comes the Sun", duration_ms: 185_000 },
  { title: "Because", duration_ms: 165_000 },
  { title: "You Never Give Me Your Money", duration_ms: 242_000 },
  { title: "Sun King", duration_ms: 146_000 },
  { title: "Mean Mr. Mustard", duration_ms: 66_000 },
  { title: "Polythene Pam", duration_ms: 72_000 },
  { title: "She Came In Through the Bathroom Window", duration_ms: 118_000 },
  { title: "Golden Slumbers", duration_ms: 91_000 },
  { title: "Carry That Weight", duration_ms: 96_000 },
  { title: "The End", duration_ms: 122_000 },
  { title: "Her Majesty", duration_ms: 23_000 }
]

tracks.each do |track|
  album.tracks.create!(
    title: track[:title],
    duration_ms: track[:duration_ms],
    file_url: Faker::Internet.url(host: 'example.com', path: "/audio/#{track[:title].downcase.gsub(' ', '_')}.mp3")
  )
end

