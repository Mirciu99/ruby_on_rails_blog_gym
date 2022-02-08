Rails.application.routes.draw do
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  get "posts", to: "apis/articles/v1/articles#index"
  
  devise_for :users, controllers: { 
    sessions: "users/sessions" 
  }
  
  root "articles#index"

  resources :articles do
    resources :comments
  end

  namespace :apis do
    namespace :articles do
      namespace :v1 do
        resources :articles, only: [:index]
        get "latest_article", to: "articles#latest_article"
      end
    end
  end
end
