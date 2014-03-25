CastingSlotMachine::Application.routes.draw do
  devise_for :users
  root to: "application#index"
  resources :projects do
    resources :characters
  end
  resources :users, only: [:show, :index]
end
