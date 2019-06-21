Rails.application.routes.draw do
  resources :task_recurrences
  resources :scrum_tasks
  resources :trackers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'trackers#index'

  get '/index', to: 'trackers#index', as: 'index' #for rerouting back to index when month is chosen
  get "/edit_track" => 'trackers#edit_track', as: 'edit_track'
  post '/update_tracker', to: 'trackers#update_tracker', as: 'update_tracker'
  get '/month_index', to: 'trackers#month_index', as: 'month_index'
  get '/complete_task', to: 'scrum_tasks#complete_task', as: 'complete_task'
end
