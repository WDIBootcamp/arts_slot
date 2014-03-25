CastingSlotMachine::Application.routes.draw do
  devise_for :users
  root to: "application#index"
  resources :projects do
    resource :characters
  end
  resources :users

end
