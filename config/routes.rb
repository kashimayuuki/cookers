Rails.application.routes.draw do
  # 管理者側 devise
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # ユーザー側 devise
  devise_for :users, skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # ゲストユーザー機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :users do
      get 'users/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
      patch 'users/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    end
    resources :menus do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :favorites, only: [:index]
    get 'search' => 'menus#search'

  end

  namespace :admin do
    root to: 'homes#top'
    resources :menus
    resources :users
    resources :genres
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
