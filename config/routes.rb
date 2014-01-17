Webttk::Application.routes.draw do

  devise_for :users

  root 'issues#index'

  concern :searchable do
    get :search, :filter, on: :collection
  end

  get '/statistics/chart_data', to: 'statistics#chart_data', as: :chart_data_statistic
  get '/statistics/:id', to: 'statistics#show', as: :statistic

  resources :issues, :statuses, :categories, :users, :devices, concerns: :searchable

end
