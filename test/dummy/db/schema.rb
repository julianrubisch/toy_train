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

ActiveRecord::Schema[7.0].define(version: 2022_04_23_113347) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toy_train_game_ranking_positions", force: :cascade do |t|
    t.string "rankable_type", null: false
    t.bigint "rankable_id", null: false
    t.integer "position", null: false
    t.float "score", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rankable_type", "rankable_id"], name: "index_toy_train_game_ranking_positions_on_rankable"
  end

  create_table "toy_train_game_records", force: :cascade do |t|
    t.integer "max_points", default: 100
    t.jsonb "data"
    t.float "max_time", default: 0.0
    t.float "points"
    t.float "time", default: 0.0
    t.integer "units"
    t.integer "game_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toy_train_overall_ranking_positions", force: :cascade do |t|
    t.string "rankable_type", null: false
    t.bigint "rankable_id", null: false
    t.integer "position", null: false
    t.float "score", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rankable_type", "rankable_id"], name: "index_toy_train_overall_ranking_positions_on_rankable"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
