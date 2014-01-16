Webttk::Application.routes.draw do

  devise_for :users

  root 'issues#index'

	get 'generic/search'
	get 'generic/filter'
	get '/statistics/chart_data', to: 'statistics#chart_data', as: :chart_data_statistic
	get '/statistics/:id', to: 'statistics#show', as: :statistic

  resources :statuses, :issues, :categories, :users, :devices

end
