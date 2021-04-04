Rails.application.routes.draw do
  
  get 'homes/top'
  get 'homes/about'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  
  namespace :admins do
    resources :members, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  scope module: :users do
    root to: "homes#top"
    get '/members/mypage' => 'members#show'
    get "/members/unsubscribe" => "members#unsubscribe"
    patch "/members/withdraw" => "members#withdraw"
    get "/members/mypage/edit" => "members#edit"
    patch "/members/mypage" => "members#update"
    
    resources :comments
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
