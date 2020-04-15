json.extract! daily_task, :id, :category, :name, :completed, :repeat_recurrence_id, :active, :is_today_task, :created_at, :updated_at
json.url daily_task_url(daily_task, format: :json)
