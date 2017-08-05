Rails.application.routes.draw do

  devise_for :users
  #resources :comments
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
