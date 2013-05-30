Rubysis::Application.routes.draw do
  
  get "static_pages/home"
  root to: 'static_pages#home'
  
  devise_for :teachers, controllers: {
    registrations: "custom_devise/registrations",
    passwords: "custom_devise/passwords"
  }

  devise_for :admins
  
  resources :schools, :only => :index

  resources :students do 
    resources :addresses
    resources :parents
    resource :schedule
    resources :sections do
      resources :grades
      resources :attendances
    end
  end
  
  resources :parents do
    resources :addresses
  end
  
  scope "/admin" do
    resources :teachers, :only => [:index, :new, :create, :update, :edit, :show] do
      resources :addresses
    end
  end
  
  resources :courses do
    resources :sections
  end
  
  resources :school_years do
    resources :semesters
  end
  
  resources :semesters do
    resources :grading_periods
  end
  
  namespace :instructor do
    resources :sections do 
      resource :section_attendance, path: 'attendance', as: :attendance
      resources :students do
        resources :grades
        resources :attendances
      end
    end
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
