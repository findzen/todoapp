Rails.application.routes.draw do
  resources :todos, only: [:index, :create, :update, :destroy]
  root 'application#index'
  get '*path' => 'application#index'
end
