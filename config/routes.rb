Rails.application.routes.draw do
  get 'customers/new'
  get '/search', to: 'pages#search_product_by_name'
  get 'categories/index'
  get 'categories/new'
  get 'sessions/new'
  get 'shops/new'
  root 'static_pages#home'
  get  '/about',         to: 'static_pages#about'
  get  '/help',          to: 'static_pages#help'
  get  '/contact',       to: 'static_pages#contact'
  get  '/signup_shop',   to: 'shops#new'
  post '/signup_shop',   to: 'shops#create'
  get  '/login_shop',    to: 'sessions#new_shop'
  post '/login_shop',    to: 'sessions#create_shop'
  delete '/logout_shop', to: 'sessions#destroy_shop'
  get '/signup',         to: 'customers#new'
  get '/login',          to: 'sessions#new_customer'
  post '/login',         to: 'sessions#create_customer'
  delete '/logout',      to: 'sessions#destroy_customer'
  resources :shops
  resources :products
  resources :categories
  resources :customers
end
