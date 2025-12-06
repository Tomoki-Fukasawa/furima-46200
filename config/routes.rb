Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :buyers, only:[:index,:new,:create]
  end
end
