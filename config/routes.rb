Rails.application.routes.draw do
  root 'home#index'
  
  #devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :downloads
  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  get 'pages/download'
  get 'categories/downloads'
  get 'polls/chart'
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :suggestions
  resources :announcements
  resources :polls
  resources :posts
  
  resources :galleries do
    resources :gallery_attachments
  end
  
  resources :posts do
  	resources :comments do
  	  member do
  	      put "like" => "comments#upvote"
  	      put "unlike" => "comments#downvote"
       end
  	end
  	member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end
  
end
