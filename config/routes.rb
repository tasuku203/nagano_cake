Rails.application.routes.draw do
  devise_for :customers,skip: [:password,], controllers:{
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }
  devise_for :admin,skip: [:registration, :password,], controllers:{
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get '/', to: 'homes#top'
    resources :items, only: [:index, :create, :new, :update, :edit, :show]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    get '/orders/:id', to: 'orders#show'
    patch '/orders/:id', to: 'orders#update'
    patch '/order_details/:id', to: 'order_details#update'


  end
    root to: "customers/homes#top"
  scope module: :customers do
    get '/', to: 'homes#top'
    get '/about', to: 'homes#about'

    get '/customers/my_page', to:'customers#show'
    get '/customers/current_customer/edit', to: 'customers#edit'
    patch '/customers/current_customer', to: 'customers#update'
    get '/customers/current_customer/confirm', to: 'customers#confirm'
    patch '/customers/current_customer/withdrawal', to: 'customers#withdrawal', as:'customers_current_customer_withdrawal'

    resources :items, only:[:index, :show]

    resources :orders, only:[:new, :create, :index, :show] do
      collection do
        get :complete
        post :confirm
      end
    end
    #post '/orders/confirm', to: 'orders#confirm'
   # get '/orders/complete', to: 'orders#complete'

    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :cart_items, only:[:index, :update, :create] do
      collection do
        delete :destroy_all
      end

      member do
      #urlにidを必要とする場合はmember, 必要としない場合はcellectionを使う
        delete :destroy
      end
    end
  end
end