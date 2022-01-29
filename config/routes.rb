Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin, controllers:{
    sessions: 'admin/sessions'
  }
  root to: 'homes#top'
end
