# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160613060007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deck_question_words", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "word_id"
    t.integer  "deck_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "is_correct",  default: 0
    t.integer  "level",       default: 0
  end

  add_index "deck_question_words", ["deck_id"], name: "index_deck_question_words_on_deck_id", using: :btree
  add_index "deck_question_words", ["question_id"], name: "index_deck_question_words_on_question_id", using: :btree
  add_index "deck_question_words", ["word_id"], name: "index_deck_question_words_on_word_id", using: :btree

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "focus_area", default: 0
  end

  create_table "study_sessions", force: :cascade do |t|
    t.integer  "user_deck_id"
    t.integer  "score"
    t.datetime "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "weight"
  end

  add_index "study_sessions", ["user_deck_id"], name: "index_study_sessions_on_user_deck_id", using: :btree

  create_table "user_decks", force: :cascade do |t|
    t.integer  "deck_id"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "study_rate_per_week"
    t.integer  "average_deck_score",  default: 0
    t.integer  "mastery_level",       default: 1
  end

  add_index "user_decks", ["deck_id"], name: "index_user_decks_on_deck_id", using: :btree
  add_index "user_decks", ["user_id"], name: "index_user_decks_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "oauth_expires_at"
    t.string   "provider"
    t.string   "graph"
    t.string   "password"
    t.string   "password_digest"
  end

  create_table "words", force: :cascade do |t|
    t.text "trad"
    t.text "simp"
    t.text "pinyin"
    t.text "definition"
  end

  add_index "words", ["simp"], name: "ix_simp", using: :btree
  add_index "words", ["trad"], name: "ix_trad", using: :btree

  add_foreign_key "deck_question_words", "decks"
  add_foreign_key "deck_question_words", "questions"
  add_foreign_key "deck_question_words", "words"
  add_foreign_key "study_sessions", "user_decks"
  add_foreign_key "user_decks", "decks"
  add_foreign_key "user_decks", "users"
end
