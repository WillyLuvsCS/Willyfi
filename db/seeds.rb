
require 'faker'


Artist.destroy_all

# Create The Beatles artist
artist = Artist.create!(
  name: "The Beatles",
  genre: "Rock",
  profile_image: Faker::Internet.url(host: 'example.com', path: '/images/beatles_profile.jpg')
)

# Create Abbey Road album
album = artist.albums.create!(
  title: "Abbey Road"
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


# Create Pink Floyd artist
pink_floyd = Artist.create!(
  name: "Pink Floyd",
  genre: "Progressive Rock",
  profile_image: Faker::Internet.url(host: 'example.com', path: '/images/pink_floyd_profile.jpg')
)

# Create Dark Side of the Moon album
dark_side_album = pink_floyd.albums.create!(
  title: "The Dark Side of the Moon"
)

# Create tracks for Dark Side of the Moon
dsotm_tracks = [
  { title: "Speak to Me", duration_ms: 90_000 },
  { title: "Breathe", duration_ms: 163_000 },
  { title: "On the Run", duration_ms: 215_000 },
  { title: "Time", duration_ms: 413_000 },
  { title: "The Great Gig in the Sky", duration_ms: 276_000 },
  { title: "Money", duration_ms: 382_000 },
  { title: "Us and Them", duration_ms: 462_000 },
  { title: "Any Colour You Like", duration_ms: 205_000 },
  { title: "Brain Damage", duration_ms: 228_000 },
  { title: "Eclipse", duration_ms: 123_000 }
]

dsotm_tracks.each do |track|
  dark_side_album.tracks.create!(
    title: track[:title],
    duration_ms: track[:duration_ms],
    file_url: Faker::Internet.url(host: 'example.com', path: "/audio/#{track[:title].downcase.gsub(' ', '_')}.mp3")
  )
end

