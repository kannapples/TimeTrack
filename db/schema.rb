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

ActiveRecord::Schema.define(version: 2019_06_18_000545) do

  create_table "scrum_tasks", force: :cascade do |t|
    t.string "periodicity"
    t.string "category"
    t.string "task"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "task_recurrences_id"
    t.index ["task_recurrences_id"], name: "index_scrum_tasks_on_task_recurrences_id"
  end

  create_table "task_recurrences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackers", force: :cascade do |t|
    t.date "date"
    t.string "task"
    t.string "subtask_1"
    t.string "subtask_2"
    t.float "hours"
    t.time "start_time"
    t.time "end_time"
    t.float "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "month"
    t.index ["date"], name: "idx_tracker_date"
  end

end
