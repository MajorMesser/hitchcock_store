Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'products#index'

  #PATH TO SHOW INDIVIDUAL PRODUCT
  get 'products' => 'products#index'
  get 'products/:id' => 'products#show', as: 'product', id: /\d+/

  #PATH TO SHOW PRODUCTS CATEGORICALLY
  get 'category/:id' => 'category#show', as: 'category', id: /\d+/

  #PATH TO PRODUCT SEARCH
  match '/' => 'products#search', :as => 'search_results', :via => :post

  #PATH TO PRODUCT FILTERS
  match '/sale_filter.html.erb' => 'products#sale_filter', as: 'sale_filter', :via => :get
  match '/new_filter.html.erb' => 'products#new_filter', as: 'new_filter', :via => :get

  #PATH TO ADD ITEM TO CART
  match '/products/add' => 'products#add_to_cart', id: /\d+/, :via => :get

  #ROUTE TO CONTACT AND ABOUT US
  get 'about' => 'about#show'
  get 'contact' => 'contact#show'

end
