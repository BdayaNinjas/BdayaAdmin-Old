BdayaAdmin::Application.routes.draw do
  resources :evaluations
#  resources :members
  resources :hegzas
  resources :events do
    member do
      get 'approve'
      get 'add_tag'
      get 'deliver_material'
      post 'upload_image'
      post 'rate_design'
    end
  end
  namespace :geneh do
    resources :members
    resources :geneh_cases do
      # put :update
    end
  end

  match '/search/' => 'application#search', as: 'search'
  get 'application/auto_complete', as: 'auto_complete'
  resources :meetings
  
  namespace :yes do
    resources :trainers
    resources :members
    resources :training_companies
  end
  #devise_for :members, :path => "auth", :path_names => { :sign_in => 'sign_in', :sign_out => 'sign_out', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'sign_up' }
  devise_for :members, :path => "members", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'sign_up'},
             :controllers => { :invitations => 'devise/invitations'}

  get 'care/index'

  root :to => "members#lawlab"
  namespace :care do
    resources :fridays do
      collection do 
        post :create_session
      end
    end

    resources :courses
    resources :kids do
      collection do
        post :add_performance
      end
    end
    resources :members
    resources :calendar do
      collection do
        get :add_event
      end
    end
  end
  
  resources :members do
    member do
      post :update_image
    end
    resources :tasks
      post :extend_deadline
  end

  namespace :academics do
    resources :members
    resources :sessions
  end

  namespace :fr do
    resources :sponsers
    resources :members
  end

  namespace :logistics do
    resources :requests
    resources :members
    resources :materials
    resources :resources
  end    
  
  
  

  namespace :hr do 
    resources :members 
   end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'members#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
