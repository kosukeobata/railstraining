Rails.application.routes.draw do
  resources :events

	root to: 'welcome#index'
	get '/auth/:provider/callback' => 'sessions#create'
	get 'logout' => 'sessions#destroy', as: :logout

	resource :user do
		get 'retire'
	end

	resources :events do
		resources :tickets
	end


end
