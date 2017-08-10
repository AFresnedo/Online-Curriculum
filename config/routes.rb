Rails.application.routes.draw do
  # mostly-static pages
  root 'static_pages#welcome'
  get '/support', to: 'static_pages#support'
  get '/about', to: 'static_pages#about'

  # User model, custom routes above resources to match first
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, only: [:show, :edit, :index, :update, :destroy]

  # user account login system
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # problems
  resources :problems, except: [:new, :create]

  # theories
  resources :theories, only: [:show]

  # temp curriculum route duties
  get '/curriculum', to: 'curriculum#index'

  # temp graph route duties
  get '/graphs/graph', to: 'graphs#graph'
  get '/graphs/batch', to: 'graphs#batch'

  # temp globalgraph route duties
  get '/globalgraph', to: 'globalgraph#index'
  get '/globalgraph/categories', to: 'globalgraph#categories'
  get '/globalgraph/context', to: 'globalgraph#context'
end
