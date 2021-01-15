Rails.application.routes.draw do
  get 'welcome/index'
  root 'articles#index'
  get 'articles/test', :to => 'articles#test'

  resources :articles
   resources :comments
end
