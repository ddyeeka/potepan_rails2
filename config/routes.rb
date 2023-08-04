Rails.application.routes.draw do
  root "homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :reservations

  resources :rooms

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_in' => 'devise/sessions#new'
    post '/users/sign_in' => 'devise/sessions#create'
    get '/users/account' => 'devise/registrations#show'
  end

  get "room/search", to: "rooms#search"

  resources :users do
    collection do
      get "search"
    end
  end

  get "/rooms/in_area/:area", to: "rooms#in_area"
  get "/rooms/search/:query", to: "rooms#search"
  
  get "room/result", to: "rooms#result", as: "room_result"

  resources :users, only: [:show, :edit, :update]

  
end