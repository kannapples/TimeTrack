json.extract! tracker, :id, :date, :task, :subtask_1, :subtask_2, :hours, :start_time, :end_time, :payment, :created_at, :updated_at
json.url tracker_url(tracker, format: :json)
