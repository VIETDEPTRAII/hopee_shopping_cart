Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
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

  get '/carts/:id',      to: 'carts#show', as: 'cart'
  delete '/carts/:id',   to: 'carts#destroy'

  post '/line_items/:id/add',    to: 'line_items#add_quantity',    as: 'line_item_add'
  post '/line_items/:id/reduce', to: 'line_items#reduce_quantity', as: 'line_item_reduce'
  post '/line_items',            to: 'line_items#create'
  get '/line_items/:id',         to: 'line_items#show',            as: 'line_item'
  delete '/line_items/:id',      to: 'line_items#destroy'

  resources :shops
  resources :products
  resources :categories
  resources :customers
  resources :orders
end
