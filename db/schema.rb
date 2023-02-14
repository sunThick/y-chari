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

ActiveRecord::Schema[7.0].define(version: 2023_02_14_052925) do
  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "likes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id", "post_id"], name: "index_likes_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "parts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "fork_brand"
    t.text "fork_name"
    t.text "headset_brand"
    t.text "headset_name"
    t.text "columnspacer_brand"
    t.text "columnspacer_name"
    t.text "handlebar_brand"
    t.text "handlebar_name"
    t.text "stem_brand"
    t.text "stem_name"
    t.text "stemcap_brand"
    t.text "stemcap_name"
    t.text "grip_brand"
    t.text "grip_name"
    t.text "bartape_brand"
    t.text "bartape_name"
    t.text "barend_brand"
    t.text "barend_name"
    t.text "saddle_brand"
    t.text "saddle_name"
    t.text "seatpost_brand"
    t.text "seatpost_name"
    t.text "seatclamp_brand"
    t.text "seatclamp_name"
    t.text "tire_brand"
    t.text "tire_name"
    t.text "tube_brand"
    t.text "tube_name"
    t.text "wheel_brand"
    t.text "wheel_name"
    t.text "hub_brand"
    t.text "hub_name"
    t.text "cog_brand"
    t.text "cog_name"
    t.text "lockring_brand"
    t.text "lockring_name"
    t.text "freewheel_brand"
    t.text "freewheel_name"
    t.text "quickrelease_brand"
    t.text "quickrelease_name"
    t.text "crank_brand"
    t.text "crank_name"
    t.text "chainring_brand"
    t.text "chainring_name"
    t.text "chain_brand"
    t.text "chain_name"
    t.text "bottombrancket_brand"
    t.text "bottombrancket_name"
    t.text "pedals_brand"
    t.text "pedals_name"
    t.text "toecrip_brand"
    t.text "toecrip_name"
    t.text "toestrap_brand"
    t.text "toestrap_name"
    t.text "brake_brand"
    t.text "brake_name"
    t.text "brakelever_brand"
    t.text "brakelever_name"
    t.text "brakecable_brand"
    t.text "brakecable_name"
    t.text "shihter_brand"
    t.text "shihter_name"
    t.text "rack_brand"
    t.text "rack_name"
    t.text "bottle_brand"
    t.text "bottle_name"
    t.text "light_brand"
    t.text "light_name"
    t.text "lock_brand"
    t.text "lock_name"
    t.text "bell_brand"
    t.text "bell_name"
    t.text "helmet_brand"
    t.text "helmet_name"
    t.text "bag_brand"
    t.text "bag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id", null: false
    t.index ["post_id"], name: "index_parts_on_post_id"
  end

  create_table "posts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "brand"
    t.string "frame"
    t.text "comment"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "parts", "posts"
  add_foreign_key "posts", "users"
end
