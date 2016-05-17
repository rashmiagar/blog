Rails.application.routes.draw do
  root 'posts#home'
  resources :friendships
  resources :posts do
    member do
      post 'publish'
      post 'share'
    end
    collection do
      get 'home' => 'posts#public_posts', as: :home
    end
  end

  get 'users/current' => 'users#current', as: :profile
  get 'users' => 'users#index'
  devise_for :users, path: '', 
          path_names: { sign_in: 'login', sign_up: 'register'}

end