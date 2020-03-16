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
  get  '/login_shop',    to: 'sessions#new'
  post '/login_shop',    to: 'sessions#create'
  delete '/logout_shop', to: 'sessions#destroy'
  get '/signup',         to: 'customers#new'
  resources :shops
  resources :products
  resources :categories
  resources :customers
end
