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

ActiveRecord::Schema.define(version: 20150719193211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_types", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "pdfs", force: :cascade do |t|
    t.string  "name",     null: false
    t.string  "user_pdf", null: false
    t.integer "user_id",  null: false
  end

  create_table "project_arts", force: :cascade do |t|
    t.integer "art_type_id", null: false
    t.integer "project_id",  null: false
  end

  create_table "project_memberships", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "user_id",    null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string  "name",                                null: false
    t.string  "description",                         null: false
    t.boolean "collaborators_wanted", default: true
  end

  create_table "user_arts", force: :cascade do |t|
    t.integer "user_id",     null: false
    t.integer "art_type_id", null: false
  end

  create_table "user_files", force: :cascade do |t|
    t.string  "file",    null: false
    t.integer "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.string   "city",                                   null: false
    t.string   "state",                                  null: false
    t.string   "description"
    t.string   "website"
    t.boolean  "admin",                  default: false, null: false
    t.string   "username",                               null: false
    t.string   "profile_photo"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
