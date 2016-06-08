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

ActiveRecord::Schema.define(version: 20160608160023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deck_user_answers", force: :cascade do |t|
    t.integer  "deck_word_question_choice_id"
    t.integer  "deck_word_question_id"
    t.integer  "study_session_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "deck_user_answers", ["deck_word_question_choice_id"], name: "index_deck_user_answers_on_deck_word_question_choice_id", using: :btree
  add_index "deck_user_answers", ["deck_word_question_id"], name: "index_deck_user_answers_on_deck_word_question_id", using: :btree
  add_index "deck_user_answers", ["study_session_id"], name: "index_deck_user_answers_on_study_session_id", using: :btree

  create_table "deck_word_question_choices", force: :cascade do |t|
    t.integer  "deck_word_question_id"
    t.text     "name"
    t.boolean  "is_correct"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "deck_word_question_choices", ["deck_word_question_id"], name: "index_deck_word_question_choices_on_deck_word_question_id", using: :btree

  create_table "deck_word_questions", force: :cascade do |t|
    t.integer  "deck_word_id"
    t.integer  "question_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "deck_word_questions", ["deck_word_id"], name: "index_deck_word_questions_on_deck_word_id", using: :btree
  add_index "deck_word_questions", ["question_id"], name: "index_deck_word_questions_on_question_id", using: :btree

  create_table "deck_words", force: :cascade do |t|
    t.integer  "deck_id"
    t.integer  "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "deck_words", ["deck_id"], name: "index_deck_words_on_deck_id", using: :btree
  add_index "deck_words", ["word_id"], name: "index_deck_words_on_word_id", using: :btree

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "study_sessions", force: :cascade do |t|
    t.integer  "user_deck_id"
    t.integer  "score"
    t.datetime "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "study_sessions", ["user_deck_id"], name: "index_study_sessions_on_user_deck_id", using: :btree

  create_table "user_decks", force: :cascade do |t|
    t.integer  "deck_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  create_table "words", force: :cascade do |t|
    t.text "trad"
    t.text "simp"
    t.text "pinyin"
    t.text "definition"
  end

  add_index "words", ["simp"], name: "ix_simp", using: :btree
  add_index "words", ["trad"], name: "ix_trad", using: :btree

  add_foreign_key "deck_user_answers", "deck_word_question_choices"
  add_foreign_key "deck_user_answers", "deck_word_questions"
  add_foreign_key "deck_user_answers", "study_sessions"
  add_foreign_key "deck_word_question_choices", "deck_word_questions"
  add_foreign_key "deck_word_questions", "deck_words"
  add_foreign_key "deck_word_questions", "questions"
  add_foreign_key "deck_words", "decks"
  add_foreign_key "deck_words", "words"
  add_foreign_key "study_sessions", "user_decks"
  add_foreign_key "user_decks", "decks"
  add_foreign_key "user_decks", "users"
end
