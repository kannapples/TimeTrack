Rails.application.routes.draw do
  resources :repeat_recurrences
  resources :daily_tasks
  resources :trackers
  resources :projects
  resources :weekly_goals
  resources :project_umbrellas

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'trackers#index'

  get '/index', to: 'trackers#index', as: 'index' #for rerouting back to index when month is chosen
  get '/month_index', to: 'trackers#month_index', as: 'month_index'
  get '/complete_task_from_tracker', to: 'trackers#complete_task_from_tracker', as: 'complete_task_from_tracker'
  get '/create_task_tracker', to: 'trackers#create_task_tracker', as: 'create_task_tracker'

  get '/complete_task', to: 'daily_tasks#complete_task', as: 'complete_task'
  get '/delete_task', to: 'daily_tasks#delete_task', as: 'delete_task'
  get '/nightly_task_processing', to: 'daily_tasks#nightly_task_processing', as: 'nightly_task_processing'
  get '/mark_today_task', to: 'daily_tasks#mark_today_task', as: 'mark_today_task'
  get '/remove_today_task', to: 'daily_tasks#remove_today_task', as: 'remove_today_task'

  get '/complete_goal', to: 'weekly_goals#complete_goal', as: 'complete_goal'
  get '/new_inherited_task', to: 'weekly_goals#new_inherited_task', as: 'new_inherited_task'
  get '/delete_goal', to: 'weekly_goals#delete_goal', as: 'delete_goal'

  post '/delete_project_and_wgs', to: 'projects#delete_project_and_wgs', as: 'delete_project_and_wgs'

  post '/delete_project_umbrella_and_projects', to: 'project_umbrellas#delete_project_umbrella_and_projects', as: 'delete_project_umbrella_and_projects'
end
