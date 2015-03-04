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

ActiveRecord::Schema.define(version: 20150304054723) do

  create_table "albums", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "description",    limit: 255
    t.integer  "photo_store_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "albums", ["photo_store_id"], name: "index_albums_on_photo_store_id", using: :btree

  create_table "article_stores", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "description",      limit: 255
    t.string   "author",           limit: 255
    t.string   "translator",       limit: 255
    t.string   "image_link",       limit: 255
    t.string   "image_upload",     limit: 255
    t.string   "content",          limit: 255
    t.integer  "article_store_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "articles", ["article_store_id"], name: "index_articles_on_article_store_id", using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "book_stores", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.string   "author",        limit: 255
    t.string   "translator",    limit: 255
    t.string   "image_link",    limit: 255
    t.string   "image_upload",  limit: 255
    t.string   "content",       limit: 255
    t.integer  "book_store_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "books", ["book_store_id"], name: "index_books_on_book_store_id", using: :btree

  create_table "homes", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "lecture_stores", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "lectures", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "description",      limit: 255
    t.string   "url",              limit: 255
    t.string   "author",           limit: 255
    t.integer  "lecture_store_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "lectures", ["lecture_store_id"], name: "index_lectures_on_lecture_store_id", using: :btree

  create_table "newfeeds", force: :cascade do |t|
    t.integer  "other_item_detail_id", limit: 4
    t.integer  "album_id",             limit: 4
    t.integer  "article_id",           limit: 4
    t.integer  "book_id",              limit: 4
    t.integer  "rule_id",              limit: 4
    t.integer  "lecture_id",           limit: 4
    t.integer  "news_id",              limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "newfeeds", ["album_id"], name: "index_newfeeds_on_album_id", using: :btree
  add_index "newfeeds", ["article_id"], name: "index_newfeeds_on_article_id", using: :btree
  add_index "newfeeds", ["book_id"], name: "index_newfeeds_on_book_id", using: :btree
  add_index "newfeeds", ["lecture_id"], name: "index_newfeeds_on_lecture_id", using: :btree
  add_index "newfeeds", ["news_id"], name: "index_newfeeds_on_news_id", using: :btree
  add_index "newfeeds", ["other_item_detail_id"], name: "index_newfeeds_on_other_item_detail_id", using: :btree
  add_index "newfeeds", ["rule_id"], name: "index_newfeeds_on_rule_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "during",       limit: 255
    t.string   "place",        limit: 255
    t.string   "content",      limit: 255
    t.string   "image_link",   limit: 255
    t.string   "image_upload", limit: 255
    t.string   "description",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "other_item_details", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "source",        limit: 255
    t.string   "author",        limit: 255
    t.string   "postor",        limit: 255
    t.string   "translator",    limit: 255
    t.string   "during",        limit: 255
    t.string   "place",         limit: 255
    t.string   "content",       limit: 255
    t.string   "image_link",    limit: 255
    t.string   "image_upload",  limit: 255
    t.string   "url",           limit: 255
    t.string   "description",   limit: 255
    t.string   "status",        limit: 255
    t.string   "view",          limit: 255
    t.string   "show",          limit: 255
    t.string   "params",        limit: 255
    t.integer  "other_item_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "other_item_details", ["other_item_id"], name: "index_other_item_details_on_other_item_id", using: :btree

  create_table "other_items", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "other_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "other_items", ["other_id"], name: "index_other_items_on_other_id", using: :btree

  create_table "others", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "photo_stores", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "url",         limit: 255
    t.string   "description", limit: 255
    t.integer  "album_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id", using: :btree

  create_table "rule_stores", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.string   "author",        limit: 255
    t.string   "translator",    limit: 255
    t.string   "image_link",    limit: 255
    t.string   "image_upload",  limit: 255
    t.string   "content",       limit: 255
    t.integer  "rule_store_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "rules", ["rule_store_id"], name: "index_rules_on_rule_store_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.boolean  "suppervisor",     limit: 1
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
