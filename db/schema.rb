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

ActiveRecord::Schema.define(version: 20180415214620) do

  create_table "decks", force: :cascade do |t|
    t.string   "card"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "table_id"
    t.integer  "user_id"
    t.integer  "player_number"
    t.boolean  "folded"
    t.integer  "buy_ins"
    t.integer  "purse"
    t.integer  "latest_bet_this_round"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "c1"
    t.string   "c2"
    t.string   "latest_move"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "table_id"
    t.boolean  "folded"
    t.string   "cards"
    t.string   "hand"
    t.boolean  "won"
    t.boolean  "lone_survivor"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tables", force: :cascade do |t|
    t.integer  "pot"
    t.string   "stage"
    t.integer  "button_holder"
    t.integer  "active_player"
    t.string   "p1c1"
    t.string   "p1c2"
    t.string   "p2c1"
    t.string   "p2c2"
    t.string   "p3c1"
    t.string   "p3c2"
    t.string   "p4c1"
    t.string   "p4c2"
    t.string   "p5c1"
    t.string   "p5c2"
    t.string   "p6c1"
    t.string   "p6c2"
    t.string   "flop1"
    t.string   "flop2"
    t.string   "flop3"
    t.string   "river"
    t.string   "turn"
    t.integer  "small_blind"
    t.integer  "big_blind"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "min_bet"
    t.string   "winners"
    t.string   "winnings"
    t.string   "winning_hands"
    t.integer  "buy_in"
    t.string   "name"
    t.string   "password"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
