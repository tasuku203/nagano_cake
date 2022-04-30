Rails.application.routes.draw do
  devise_for :customers,skip: [:password,], controllers:{
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }
  devise_for :admin,skip: [:registration, :password,], controllers:{
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get '/admin', to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
  end

  scope module: :public do
    resources :items, only:[:index, :show]
  end
end