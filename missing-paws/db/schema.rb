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

ActiveRecord::Schema.define(version: 20150905071535) do

  create_table "adoptions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "city"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "adoptions", ["user_id"], name: "index_adoptions_on_user_id"

  create_table "animal_shelters", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "phone"
    t.string   "website"
    t.string   "city"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "animal_shelters", ["user_id"], name: "index_animal_shelters_on_user_id"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.text     "image"
    t.text     "category"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "forum_comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "forum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "forum_comments", ["forum_id"], name: "index_forum_comments_on_forum_id"
  add_index "forum_comments", ["user_id"], name: "index_forum_comments_on_user_id"

  create_table "forums", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "views"
  end

  add_index "forums", ["user_id"], name: "index_forums_on_user_id"

  create_table "found_animals", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "city"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "found_animals", ["user_id"], name: "index_found_animals_on_user_id"

  create_table "lost_animals", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "city"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "lost_animals", ["user_id"], name: "index_lost_animals_on_user_id"

  create_table "pet_academies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "phone"
    t.string   "website"
    t.string   "city"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "pet_academies", ["user_id"], name: "index_pet_academies_on_user_id"

  create_table "pet_hotels", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "name"
    t.string   "phone"
    t.string   "website"
    t.string   "city"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "pet_hotels", ["user_id"], name: "index_pet_hotels_on_user_id"

  create_table "pet_shops", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "phone"
    t.string   "website"
    t.string   "city"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "pet_shops", ["user_id"], name: "index_pet_shops_on_user_id"

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "category"
    t.string   "title"
    t.text     "picture"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "topics", ["user_id"], name: "index_topics_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",               default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "vet_centers", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "phone"
    t.string   "website"
    t.string   "city"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "vet_centers", ["user_id"], name: "index_vet_centers_on_user_id"

end
