Rails.application.routes.draw do
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
  resources :contacts, only: [:new, :create]
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  resources :feeds
  resources :feeds do
    collection do
      post :confirm
    end
  end
end
