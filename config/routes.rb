Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  
  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  scope module: :users do
    root to: "homes#top"
    get '/users/mypage' => 'users#show', as: 'mypage'
    get "/users/unsubscribe" => "customers#unsubscribe"
    patch "/users/withdraw" => "customers#withdraw"
    get "/users/edit" => "customers#edit"
    patch "/users" => "customers#update"
    
    resources :comments
    resources :posts
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
