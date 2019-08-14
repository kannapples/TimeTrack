json.extract! scrum_task, :id, :task_recurrences_id, :category, :task, :completed, :repeat_recurrences_id, :created_at, :updated_at
json.url scrum_task_url(scrum_task, format: :json)
