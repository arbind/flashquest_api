FlashquestApi::Application.routes.draw do

  get "home/index"

  resources :businesses, only: [:index, :show], :defaults => { :format => 'json' } do
    resources :branches, only: [:index], :defaults => { :format => 'json' }
  end

  resources :people, only: [:show], :defaults => { :format => 'json' }

  resources :branches, only: [:show], :defaults => { :format => 'json' } do
    resources :patrons, only: [:index], :defaults => { :format => 'json' }
    resources :quests, only: [:index], :defaults => { :format => 'json' }
    resources :rewards, only: [:index], :defaults => { :format => 'json' }
  end

  resources :patrons, only: [:show], :defaults => { :format => 'json' }

  resources :quests, only: [:show], :defaults => { :format => 'json' }
  resources :rewards, only: [:show], :defaults => { :format => 'json' }

  get "/businesses/:id/branches(.:format)" => "businesses#branches", :defaults => { :format => 'json' }

  get "/businesses/:id/quests(.:format)" => "businesses#quests", :defaults => { :format => 'json' }
  get "/businesses/:id/rewards(.:format)" => "businesses#rewards", :defaults => { :format => 'json' }
  get "/businesses/:id/reviews(.:format)" => "businesses#reviews", :defaults => { :format => 'json' }
  get "/businesses/:id/photos(.:format)" => "businesses#photos", :defaults => { :format => 'json' }
  get "/businesses/:id/activity(.:format)" => "businesses#activity", :defaults => { :format => 'json' }

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
