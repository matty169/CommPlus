CommPlus::Application.routes.draw do
  post "/events/request_event", to: 'events#request_event', as: 'request_event'
  get "users/:id/skills", to: 'users#skills'
  get "users/:id/skills_teach", to: 'users#skills_teach'
  get "users/:id/skills_learn", to: 'users#skills_learn'
  get "skills/tree", to: 'skills#tree'
  

  
  resources :tags

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks", registrations: "registrations"} do
    get "/registrations/after_register", to: 'registrations#after_register', as: 'after_register'
  end

  resources :attendees

  resources :events
  post "/events/:id", to: 'events#attend_event', as: 'attend_event'
  post "/events/:id", to: 'events#unattend', as: 'unattend'



  resources :skills

  get "/about", to: 'static_pages#about'


  # Alter the root directory if the user is signed in or not.
  authenticated :user do
    get "/" => "skills#index"
  end
    root :to => "static_pages#home"


  resources :users


  get "/recommended", to: 'skills#match'
  get "/explore", to: 'skills#explore'
  

  namespace :api do
    resources :users, only: [:index, :show, :create, :update, :destroy]
    resources :events, only: [:index, :show, :create, :update, :destroy]
    resources :skills, only: [:index, :show, :create, :update, :destroy]
    resources :attendees, only: [:create, :destroy]

    devise_scope :user do
      post 'registrations' => 'registrations#create', :as => 'register'
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
    end
  end

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
