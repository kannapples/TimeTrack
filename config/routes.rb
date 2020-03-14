Rails.application.routes.draw do
  resources :task_recurrences
  resources :scrum_tasks
  resources :trackers
  resources :projects
  resources :project_modules
  resources :project_umbrellas

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'trackers#index'

  get '/index', to: 'trackers#index', as: 'index' #for rerouting back to index when month is chosen
  post '/update_tracker', to: 'trackers#update_tracker', as: 'update_tracker'
  get '/month_index', to: 'trackers#month_index', as: 'month_index'
  get '/complete_task', to: 'trackers#complete_task', as: 'complete_task'
  get '/complete_task_from_tracker', to: 'trackers#complete_task_from_tracker', as: 'complete_task_from_tracker'
  get '/create_task_tracker', to: 'trackers#create_task_tracker', as: 'create_task_tracker'
  get 'new_inherited_task', to: 'scrum_tasks#new_inherited_task', as: 'new_inherited_task'
  get '/delete_task', to: 'scrum_tasks#delete_task', as: 'delete_task'
  get '/nightly_task_processing', to: 'scrum_tasks#nightly_task_processing', as: 'nightly_task_processing'
  get '/mark_today_task', to: 'scrum_tasks#mark_today_task', as: 'mark_today_task'
  get '/remove_today_task', to: 'scrum_tasks#remove_today_task', as: 'remove_today_task'
end
