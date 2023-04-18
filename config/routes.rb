Rails.application.routes.draw do
	# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	get '/tickets', to: 'tickets#index'
	get 'tickets/fetch', to: 'tickets#fetch_tickets', as: 'fetch_tickets'
	# Defines the root path route ("/")
	# root "articles#index"
end
