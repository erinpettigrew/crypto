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

ActiveRecord::Schema.define(version: 20170821163425) do

  create_table "avatars", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "avatars", ["user_id"], name: "index_avatars_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.integer  "theme_id"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true
  add_index "categories", ["theme_id"], name: "index_categories_on_theme_id"

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.string   "image"
    t.string   "ticker"
    t.string   "about"
  end

  add_index "currencies", ["slug"], name: "index_currencies_on_slug", unique: true

  create_table "currency_products", force: :cascade do |t|
    t.integer  "currency_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "exchange_incidents", force: :cascade do |t|
    t.integer "exchange_id"
    t.integer "incident_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.string  "name"
    t.string  "about"
    t.string  "requirements"
    t.string  "image"
    t.string  "slug"
    t.string  "location"
    t.boolean "bank_transfer"
    t.boolean "credit_card"
    t.boolean "paypal"
    t.string  "founded_date"
    t.string  "volume"
    t.string  "fees"
    t.boolean "ny_permitted"
    t.float   "fee_ratio"
    t.boolean "fiat"
    t.string  "temp_fee_ratio"
    t.float   "fees_ratio"
    t.string  "url"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "incidents", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "url"
    t.string   "amount"
  end

  create_table "investments", force: :cascade do |t|
    t.integer "investor_id"
    t.integer "exchange_id"
  end

  create_table "investors", force: :cascade do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "look_products", force: :cascade do |t|
    t.integer "look_id"
    t.integer "product_id"
  end

  create_table "photos", force: :cascade do |t|
    t.text     "comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "product_photo"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "title"
    t.string   "image"
    t.text     "excerpt"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "source"
  end

  create_table "product_posts", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_posts", ["post_id"], name: "index_product_posts_on_post_id"
  add_index "product_posts", ["product_id"], name: "index_product_posts_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "image"
    t.string   "slug"
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "theme_id"
    t.string   "link"
    t.integer  "uses_count"
    t.string   "about"
    t.decimal  "rating"
    t.string   "device"
    t.string   "platform"
    t.string   "location"
    t.string   "founded_date"
    t.boolean  "access_private_keys"
    t.string   "url"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["slug"], name: "index_products_on_slug", unique: true
  add_index "products", ["theme_id"], name: "index_products_on_theme_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "themes", force: :cascade do |t|
    t.text     "name"
    t.text     "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "themes", ["slug"], name: "index_themes_on_slug", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "user_name"
    t.string   "slug"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true

  create_table "uses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "uses", ["product_id"], name: "index_uses_on_product_id"
  add_index "uses", ["user_id"], name: "index_uses_on_user_id"

  create_table "wants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wants", ["product_id"], name: "index_wants_on_product_id"
  add_index "wants", ["user_id"], name: "index_wants_on_user_id"

end
