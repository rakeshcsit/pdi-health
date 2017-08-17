Rails.application.routes.draw do

  get "/doctor-dashboard", to: "static#doctor_dashboard", :as => :doctor_dashboard

  resources :inrs

  resources :reps

  resources :staffs

  resources :doctors

  resources :patients

  resources :student_feedbacks

  get 'compare-audits', to: 'compare_audits#compare_choose', :as => :compare_audits

  get 'instructors-all' => 'instructors#all', as: :all_instructors

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, :except => [:new, :create]

  resources :student_success_managers

  resources :tier_updates, :except => [:new, :create]

  authenticated :user do
    root :to => 'audits#index'
  end

  devise_scope :user do
    unauthenticated do
      root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end

  resources :audits

  resources :lesson_plans

  resources :instructors

  resources :rds

  resources :analysts

  resources :universities

  resources :tiers

  # resources :posts
  #
  # resources :cat_toys
  #
  # resources :panthers
  #
  # resources :lion_tamers
  #
  # resources :lions

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
