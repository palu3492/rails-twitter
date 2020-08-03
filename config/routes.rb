Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root 'tweets#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'

  resources :tweets do
    resources :comments
  end

end
