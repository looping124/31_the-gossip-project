Rails.application.routes.draw do


  # get '/gossips/index' #la
  # get '/gossips/show/:id',to: 'gossips#show', as: 'gossip_show' #et j'etais la
  # get '/gossips/new'
  # get '/gossips/create'
  
  # get '/gossips/edit'
  # get '/gossips/update'
  # get '/gossips/destroy'
  resources :gossips
  resources :cities, only: [:show]

  root to:'default#home'

  get '/team(/:name)', to: 'default#team', as: 'team_name'
  get '/contact', to: 'default#contact'
  get '/welcome(/:name)', to: 'default#welcome', as: 'welcome'


  get '/user/:id',to: 'default#user', as: 'user'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'static#index'
  post '/', to: 'static#index_post'
  get '/bienvenue', to: 'static#index_in_french'


end
