# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_07_170753) do
  create_table "albums", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.string "title", null: false
    t.string "cover_image"
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.string "genre"
    t.string "profile_image"
  end

  create_table "devices", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "device_name", null: false
    t.string "device_type", null: false
    t.date "last_used"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "playlist_tracks", force: :cascade do |t|
    t.integer "playlist_id", null: false
    t.integer "track_id", null: false
    t.integer "position"
    t.index ["playlist_id"], name: "index_playlist_tracks_on_playlist_id"
    t.index ["track_id"], name: "index_playlist_tracks_on_track_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "plan_type", null: false
    t.decimal "price", precision: 5, scale: 2
    t.date "start_date", null: false
    t.date "end_date"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "album_id", null: false
    t.string "title", null: false
    t.integer "duration_ms", null: false
    t.string "file_url", null: false
    t.index ["album_id"], name: "index_tracks_on_album_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_hash", null: false
    t.date "created_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "devices", "users"
  add_foreign_key "playlist_tracks", "playlists"
  add_foreign_key "playlist_tracks", "tracks"
  add_foreign_key "playlists", "users"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "tracks", "albums"
end
