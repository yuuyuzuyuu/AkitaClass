Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  
  namespace :admins do
    get 'top' => 'homes#top'
    resources :members, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  scope module: :users do
    root to: "homes#top"
    get 'homes/about'
    get '/members/mypage' => 'members#show'
    get "/members/unsubscribe" => "members#unsubscribe"
    patch "/members/withdraw" => "members#withdraw"
    get "/members/mypage/edit" => "members#edit"
    patch "/members/mypage" => "members#update"
    
   
    resources :help_posts do
      resources :help_comments, only: [:create, :destroy]
      resource :help_likes, only: [:create, :destroy]
    end
    resources :want_posts do
      resources :want_comments, only: [:create, :destroy]
      resource :want_likes, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
