Rails.application.routes.draw do
  resources :bands
  resources :events
  resources :venues
  get 'welcome/Index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
