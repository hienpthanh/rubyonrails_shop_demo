Rails.application.routes.draw do
  root 'index#index'
  get 'index/index'
  resources :products
  get 'products/active/:id' => 'products#active'
  get 'products/delete/:id' => 'products#delete'
  resources :customers
  get 'customers/delete/:id' => 'customers#delete'
  # controller :products do
  # get 'products/:id' => 'products#active'
  # end
  controller :category do
  get 'category' => :index
  get 'category/new' => :new
  post 'category/create' => :create
  get 'category/:id' => :edit
  post 'category/:id' => :update
  delete 'category/:id' => :delete
  end
  #supplier
  controller :supplier do
  get 'supplier' => :index
  get 'supplier/new' => :new
  get 'supplier/:id' => :edit
  post 'supplier/:id' => :update
  delete 'supplier/:id' => :delete
  end
  #unit
  controller :unit do
  get 'unit' => :index
  get 'unit/index' => :index
  get 'unit/new' => :new
  get 'unit/:id' => :edit
  post 'unit/:id' => :update
  delete 'unit/:id' => :delete
  end

  #warehouse
  controller :warehouse do
  get 'warehouse' => :index
  get 'warehouse/index' => :index
  get 'warehouse/new' => :new
  post 'warehouse/create' => :create
  get 'warehouse/show/:id' => :show
  get 'warehouse/:id' => :edit
  post 'warehouse/:id' => :update
  delete 'warehouse/:id' => :delete
  get 'warehouse/import/:id' => :import
  end

  #orders
  controller :orders do
  get 'orders/get_district/:province_id' => :get_district
  get 'orders/get_ward/:district_id' => :get_ward
  post 'orders/create' => :create
  get 'orders/new' => :new
  get 'orders/:id' => :edit
  post 'orders/:id' => :update
  end

  #ajax
  controller :ajax do
  get 'ajax/get_district/:province_id' => :get_district
  get 'ajax/get_ward/:district_id' => :get_ward
  end

  # controller :product do
  # get 'product' => :index
  # end
  resources :category
  resources :supplier
  resources :unit
  resources :products
  resources :items
  resources :warehouse
  resources :orders
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # resources :orders do
  #   get 'changestatus' => :changestatus
  #   resources :orderitems
  # end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
