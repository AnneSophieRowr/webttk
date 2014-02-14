Webttk::Application.routes.draw do

  devise_for :users

  root 'issues#index'

  concern :searchable do
    get :search, :filter, on: :collection
  end

  get '/statistics/chart_data', to: 'statistics#chart_data', as: :chart_data_statistic
  get '/statistics/:id', to: 'statistics#show', as: :statistic

  resources :statuses, :categories, :users, concerns: :searchable

  resources :issues, concerns: :searchable do 
    resources :acts
  end

  resources :devices, concerns: :searchable do
    get :history, on: :member
    get :sleep, on: :member
    get :wake, on: :member
  end

end
