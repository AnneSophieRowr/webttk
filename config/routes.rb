Webttk::Application.routes.draw do
  devise_for :users

  root 'issues#index'

	get 'generic/search'
	get 'generic/filter'
	get '/statistics/:id', to: 'statistics#show'
	get '/statistics/chart_data'

  resources :statuses, :issues, :categories, :users, :statistics

end
