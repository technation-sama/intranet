Rails.application.routes.draw do

  resources :gallery_attachments
  resources :galleries
  get 'categories/downloads'

  resources :downloads
  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  get 'pages/download'

  resources :suggestions
  resources :announcements
  resources :polls
  #devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :posts
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
  root 'home#index'

  # routes for tags/categories
  get 'tags/:tag', to: 'posts#index', as: :tag

end
