Rails.application.routes.draw do
  get 'shops/new'
  root 'static_pages#home'
  get  '/about',    to: 'static_pages#about'
  get  '/help',     to: 'static_pages#help'
  get  '/contact',  to: 'static_pages#contact'
  get  '/signup',   to: 'shops#new'
  post '/signup',   to: 'shops#create'
  resources :shops
end
