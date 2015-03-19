Rails.application.routes.draw do
  resources :todos
  root 'application#index'
  get '*path' => 'application#index'
end
