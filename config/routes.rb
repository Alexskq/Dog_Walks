Rails
  .application
  .routes
  .draw do
    devise_for :users,
               controllers: {
                 registrations: 'users/registrations', # rubocop:disable Style/StringLiterals
                 sessions: 'users/sessions' # rubocop:disable Style/StringLiterals
               }

    resources :walks do
      resources :user_walks, only: %i[new create destroy]
    end

    resource :dog, only: [:update]

    get "manifest" => 'rails/pwa#manifest', as: :pwa_manifest
    get "service-worker" => 'rails/pwa#service_worker', as: :pwa_service_worker

    root to: 'splash#index' # rubocop:disable Style/StringLiterals

    get "/home", to: "pages#home", as: 'home'

    get "/profil", to: "pages#profil", as: 'profil'
    delete "/destroy_user_walk", to: "pages#destroy_user_walk"

    namespace :admin do
      resources :walks, only: [:index, :show] do
        member do
          post :validate_participant
          post :invalidate_participant
          patch :update_admin_message
        end
      end
    end
  end
