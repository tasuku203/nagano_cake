Rails.application.routes.draw do
  devise_for :customers,skip: [:password,], controllers:{
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }
  devise_for :admin,skip: [:registration, :password,], controllers:{
    sessions: 'admin/sessions'
  }
  root to: 'homes#top'

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
end
