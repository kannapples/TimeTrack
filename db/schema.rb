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

ActiveRecord::Schema.define(version: 2020_03_02_004457) do

  create_table "project_modules", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "completion_goal_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.index ["project_id"], name: "index_project_modules_on_project_id"
  end

  create_table "project_umbrellas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "completion_goal_date"
    t.integer "project_umbrella_id"
    t.index ["project_umbrella_id"], name: "index_projects_on_project_umbrella_id"
  end

  create_table "scrum_tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "task_recurrences_id"
    t.integer "repeat_recurrences_id"
    t.boolean "active"
    t.integer "project_id"
    t.integer "project_module_id"
    t.integer "project_umbrella_id"
    t.boolean "is_daily_task"
    t.index ["is_daily_task"], name: "index_scrum_tasks_on_is_daily_task"
    t.index ["project_id"], name: "index_scrum_tasks_on_project_id"
    t.index ["project_module_id"], name: "index_scrum_tasks_on_project_module_id"
    t.index ["project_umbrella_id"], name: "index_scrum_tasks_on_project_umbrella_id"
    t.index ["repeat_recurrences_id"], name: "index_scrum_tasks_on_repeat_recurrences_id"
    t.index ["task_recurrences_id"], name: "index_scrum_tasks_on_task_recurrences_id"
  end

  create_table "task_recurrences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackers", force: :cascade do |t|
    t.date "date"
    t.string "description"
    t.float "hours"
    t.time "start_time"
    t.time "end_time"
    t.float "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "month"
    t.boolean "active"
    t.integer "project_id"
    t.integer "project_module_id"
    t.integer "scrum_task_id"
    t.integer "project_umbrella_id"
    t.index ["date"], name: "idx_tracker_date"
    t.index ["project_id"], name: "index_trackers_on_project_id"
    t.index ["project_module_id"], name: "index_trackers_on_project_module_id"
    t.index ["project_umbrella_id"], name: "index_trackers_on_project_umbrella_id"
    t.index ["scrum_task_id"], name: "index_trackers_on_scrum_task_id"
  end

end
