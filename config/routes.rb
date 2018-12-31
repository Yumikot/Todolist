Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :lists do
    resources :items 
  end
  root 'welcome#index'
end
