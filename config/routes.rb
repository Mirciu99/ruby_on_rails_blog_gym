Rails.application.routes.draw do
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  devise_for :users, controllers: { 
    sessions: "users/sessions" 
  }
  
  root "articles#index"

  resources :articles do
    resources :comments
  end
end
