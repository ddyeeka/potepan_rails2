Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  get 'users/:id/profile', to: 'users#show', as: 'user_profile'

  root 'homes#top'

  devise_scope :user do
    get '/users/account' => 'devise/registrations#show'
  end

  resources :users, only: [:show, :edit, :update]

  
  

end
