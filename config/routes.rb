Rails.application.routes.draw do

  namespace :admin do
    get 'user_application_details/update'
  end
  namespace :public do
    get 'user_application_details/update'
  end
    # 顧客用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top' #'equipments#index'
    resources :user_applications, only: [:show, :update] do
    member do
        get 'user', to: 'user_applications#user_application_user', as: 'user_application_user'
      end
    end
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :equipments, only: [:index, :new, :create, :show, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    resources :equipments, only: [:show]
    resources :users, only: [:show, :edit, :update]
    resources :user_application_details
    resources :cart_equipments, only: [:index, :update, :create, :destroy] do
      collection do
        delete 'all_destroy', to: 'cart_equipments#all_destroy'
      end
    end
    resources :user_applications, only: [:new, :create, :index, :show] do
      collection do
        get 'use_list'
        post 'confirm'
      end
    end
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end