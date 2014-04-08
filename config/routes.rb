CastingSlotMachine::Application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  devise_for :users
  root to: "application#index"
  resources :projects do
    resources :characters
  end
  resources :users, only: [:show, :index, :edit, :update]
  get '/usersProject', to: 'projects#latest_project' 
end
