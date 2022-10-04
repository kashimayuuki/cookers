Rails.application.routes.draw do
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
  devise_for :admin, skip: [:registrations, :passwords], contcollers: {
    sessions: 'admin/sessions'
  }
  devise_for :users, skip: [:passwords],controller: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
