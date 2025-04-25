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

    root to: 'splash#index' # rubocop:disable Style/StringLiterals

    get "/home", to: "pages#home", as: 'home'

    get "/profil", to: "pages#profil", as: 'profil'
    delete "/destroy_user_walk", to: "pages#destroy_user_walk"

    namespace :admin do
      resources :walks do
        member do
          post :validate
          post :invalidate
        end
      end
    end
  end
