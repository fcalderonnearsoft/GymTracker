Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :exercises
  resources :evaluations do
    member do
      get :new_register
      post :register
    end
  end
  get '/home', to: 'evaluations#statistics', as: 'evaluations_statistics'


  root to: 'evaluations#statistics'
end
