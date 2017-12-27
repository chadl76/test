Rails.application.routes.draw do

	devise_scope :user do
		#root 'users#index'
		root 'devise/registrations#new'
	end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
 	

 	resources :users, only: [:index, :show] do		 
 		resource :profile
 		resources :photos
 		get 'upload' => 'photos#new'
 	end
 	resources :friendships, only: [:create, :update, :destroy]
 	resources :likes
 	resources :posts, only: [:index, :show, :create, :destroy] do 
 		resources :likes
 		resources :comments, only: [:new, :show, :create, :update, :destroy]
 	end


 	get 'newsfeed/:id', to:'users#newsfeed',  as: :newsfeed
      	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
