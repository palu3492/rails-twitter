Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root 'tweets#index', as: 'home'

  get '/about' => 'pages#about', as: 'about'

  resources :users do
    resources :tweets
      resources :comments
  end

  resources :tweets do
    resources :comments
  end

  # Disable Clearance default routes
  Clearance.configure do |config|
    config.routes = false
  end

  # User custom routes instead on Clearance
  resources :passwords,
            controller: 'clearance/passwords',
            only: [:create, :new]

  resource :session,
           controller: 'clearance/sessions',
           only: [:create]

  resources :users,
            controller: 'clearance/users',
            only: Clearance.configuration.user_actions do
    resource :password,
             controller: 'clearance/passwords',
             only: [:edit, :update]
  end

  get '/sign_in' => 'sessions#new'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'

  get '/sign_up' => 'users#new'

end
