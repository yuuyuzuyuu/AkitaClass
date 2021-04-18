Rails.application.routes.draw do

  namespace :admins do
    get 'members/index'
  end
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }

  namespace :admins do
    get 'top' => 'homes#top'
    resources :members, only: [:index, :show]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :towns, only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  scope module: :users do
    root to: "homes#top"
    get 'homes/about'
    get "/profile/:id" => "members#show", as: :profile
    get "/members/mypage/edit" => "members#edit"
    patch "/members/mypage" => "members#update"
    get "help_posts/tag" => "help_posts#tag"
    get "want_posts/tag" => "want_posts#tag"
    get "want_posts/town" => "want_posts#town"

    resources :help_posts do
      resources :help_comments, only: [:create, :destroy]
      resource :help_likes, only: [:create, :destroy]
    end
    
    resources :want_posts do
      resources :want_comments, only: [:create, :destroy]
      resource :want_likes, only: [:create, :destroy]
      get 'get_tag_search', on: :collection, defaults: { format: 'json' }
      get 'get_tag_search', on: :member, defaults: { format: 'json' }
    end
  end
  
end
