# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_01_164307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", id: :string, force: :cascade do |t|
    t.string "artist_id", null: false
    t.string "name"
    t.string "genre"
    t.string "artist_album"
    t.string "tracks_album"
    t.string "self_album"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "artists", id: :string, force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "albums_artist"
    t.string "tracks_artist"
    t.string "self_artst"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", id: :string, force: :cascade do |t|
    t.string "album_id", null: false
    t.string "name"
    t.integer "duration"
    t.integer "times_played"
    t.string "artist_track"
    t.string "album_track"
    t.string "self_track"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

end
