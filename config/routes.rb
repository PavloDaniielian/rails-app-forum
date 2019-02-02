Rails.application.routes.draw do

  #default root as signup page
  root to: 'users#new'

  #route to signup page
  get 'users/new' => 'users#new',as: :new_user

  #route for form submission
  post 'users' => 'users#create'

  #route login action 
  get '/login' => 'sessions#new'

  #route signup action
  post '/login' => 'sessions#create'

  #route delete to user logout
  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'

  
  get 'welcome/index'
  
  get 'users' => 'sessions#hello'

  resources :users do
    resources :articles
  end

  resources :articles do
  	resources :comments
  end

  #root 'welcome#index'
end
