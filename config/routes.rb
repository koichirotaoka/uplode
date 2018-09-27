Rails.application.routes.draw do
  resources :contacts
  root 'blogs#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  get "/users/favorites/:id" => "users#favorites"
  resources :blogs do
    collection do
      post :confirm
    end
  end
  get 'top/index'
  resources :top
  resources :favorites, only: [:create, :destroy]
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
