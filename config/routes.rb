Rails.application.routes.draw do


  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/unsubscribe'
  # end

  # namespace :admin do
  #   get 'customers/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  # end

  # # namespace :admin do
  #   get 'orders/show'
  # end

  # namespace :admin do
  #   get 'items/index'
  #   get 'items/new'
  #   get 'items/show'
  #   get 'items/edit'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end
  # namespace :public do
  #   get 'orders/new'
  #   get 'orders/confirm'
  #   get 'orders/complete'
  #   get 'orders/index'
  #   get 'orders/show'
  # end
  # namespace :public do
  #   get 'cart_items/index'
  # end

  # namespace :public do
  #   get 'items/index'
  #   get 'items/show'
  # end
  # namespace :public do
  #   get 'homes/top'
  #   get 'homes/about'
  # end



    devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  scope module: :public do



    root to: 'homes#top'

    get "homes/about" => "homes#about", as: "about"



    resources :items, only: [:index, :show]


    resource :customers, only: [:show] do
      member do
        get 'information/edit' => 'customers#edit'
        patch 'information' => 'customers#update'
        get 'unsubscribe'
        patch 'withdraw'
      end
    end

    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end

  end





  # 管理者コントローラーとアクション
  namespace :admin do

    root to: 'homes#top'

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    resources :customers, only: [:index, :show, :edit, :update]

    resources :orders, only: [:show]
  end

end

