json.extract! scrum_task, :id, :periodicity, :category, :task, :completed, :created_at, :updated_at
json.url scrum_task_url(scrum_task, format: :json)
