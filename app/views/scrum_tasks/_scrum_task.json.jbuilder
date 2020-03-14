json.extract! scrum_task, :id, :task_recurrences_id, :category, :name, :completed, :repeat_recurrences_id, :active, :is_today_task, :created_at, :updated_at
json.url scrum_task_url(scrum_task, format: :json)
