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
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :users do
      get 'users/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
      patch 'users/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    end
    resources :menus
    resources :favorites
    resources :search
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
