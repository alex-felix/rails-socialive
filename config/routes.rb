Rails.application.routes.draw do
  get 'questions/create'

  get 'tickets/create'

  mount ActionCable.server => '/cable'
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :livestreams do
    resources :tickets, only: [:create]
    resources :questions, only: [:create]
  end
  get '/dashboard' => 'pages#dashboard'

# Following/Follower routing essential
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships,       only: [:create, :destroy]


  patch '/dashboard', to: 'pages#profile_update'

  ################################
  #This is for buying rubies
  get '/buy_rubies' => 'pages#buy_rubies'

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
  #################################

# This line should be at the end
  get '/:category' => 'livestreams#category_show'
  # resources :chat_rooms, only: [:new, :create, :show, :index]
end
