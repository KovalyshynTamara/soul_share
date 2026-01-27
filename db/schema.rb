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

ActiveRecord::Schema[8.0].define(version: 2025_03_31_181659) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "comment_moderations", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "moderator_id"
    t.string "action"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_moderations_on_comment_id"
    t.index ["moderator_id"], name: "index_comment_moderations_on_moderator_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_participant_id", null: false
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["event_participant_id"], name: "index_comments_on_event_participant_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "event_participants", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.string "role"
    t.boolean "is_private"
    t.boolean "is_commenting_disabled"
    t.string "user_name"
    t.string "event_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "user_id"], name: "index_event_participants_on_event_id_and_user_id", unique: true
  end

  create_table "event_songs", force: :cascade do |t|
    t.integer "event_id"
    t.integer "song_id"
    t.integer "event_participant_id"
    t.boolean "is_performed"
    t.integer "order"
    t.string "song_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_songs_on_event_id"
    t.index ["event_participant_id"], name: "index_event_songs_on_event_participant_id"
    t.index ["song_id"], name: "index_event_songs_on_song_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "location_id"
    t.string "image"
    t.string "status"
    t.integer "current_song_id"
    t.integer "current_performer_id"
    t.string "mode"
    t.boolean "comments_enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id", null: false
    t.index ["created_by_id"], name: "index_events_on_created_by_id"
    t.index ["location_id"], name: "index_events_on_location_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "song_id"], name: "index_favorites_on_user_id_and_song_id", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "country"
    t.decimal "lat"
    t.decimal "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "song_id", null: false
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "song_id"], name: "index_ratings_on_user_id_and_song_id", unique: true
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.text "lyrics"
    t.text "chords"
    t.string "genre"
    t.float "rating"
    t.integer "added_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_songs_on_added_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comment_moderations", "comments"
  add_foreign_key "comment_moderations", "event_participants", column: "moderator_id"
  add_foreign_key "comments", "event_participants"
  add_foreign_key "comments", "event_participants", column: "user_id"
  add_foreign_key "comments", "events"
  add_foreign_key "event_participants", "events"
  add_foreign_key "event_participants", "users"
  add_foreign_key "event_songs", "event_participants"
  add_foreign_key "event_songs", "events"
  add_foreign_key "event_songs", "songs"
  add_foreign_key "events", "locations"
  add_foreign_key "events", "users", column: "created_by_id"
  add_foreign_key "favorites", "songs"
  add_foreign_key "favorites", "users"
  add_foreign_key "ratings", "songs"
  add_foreign_key "ratings", "users"
  add_foreign_key "songs", "users", column: "added_by_id"
end
