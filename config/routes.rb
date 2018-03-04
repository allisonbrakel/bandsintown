Rails.application.routes.draw do
  resources :bands
  resources :events
  resources :venues

  root 'bands#all_data'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about' => 'welcome#about'
  get '/data' => 'bands#all_data'
  get '/list' => 'bands#list'
end

