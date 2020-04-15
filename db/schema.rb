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

ActiveRecord::Schema.define(version: 2020_03_25_182721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "repeat_recurrence_id"
    t.boolean "active"
    t.integer "project_id"
    t.integer "weekly_goal_id"
    t.integer "project_umbrella_id"
    t.boolean "is_today_task"
    t.index ["is_today_task"], name: "index_daily_tasks_on_is_today_task"
    t.index ["project_id"], name: "index_daily_tasks_on_project_id"
    t.index ["project_umbrella_id"], name: "index_daily_tasks_on_project_umbrella_id"
    t.index ["repeat_recurrence_id"], name: "index_daily_tasks_on_repeat_recurrence_id"
    t.index ["weekly_goal_id"], name: "index_daily_tasks_on_weekly_goal_id"
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

  create_table "repeat_recurrences", force: :cascade do |t|
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
    t.integer "weekly_goal_id"
    t.integer "daily_task_id"
    t.integer "project_umbrella_id"
    t.index ["daily_task_id"], name: "index_trackers_on_daily_task_id"
    t.index ["date"], name: "idx_tracker_date"
    t.index ["project_id"], name: "index_trackers_on_project_id"
    t.index ["project_umbrella_id"], name: "index_trackers_on_project_umbrella_id"
    t.index ["weekly_goal_id"], name: "index_trackers_on_weekly_goal_id"
  end

  create_table "weekly_goals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.boolean "completed"
    t.integer "repeat_recurrence_id"
    t.boolean "active"
    t.integer "project_umbrella_id"
    t.index ["project_id"], name: "index_weekly_goals_on_project_id"
    t.index ["project_umbrella_id"], name: "index_weekly_goals_on_project_umbrella_id"
    t.index ["repeat_recurrence_id"], name: "index_weekly_goals_on_repeat_recurrence_id"
  end

end
