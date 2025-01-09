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
root to: 'pages#home' # rubocop:disable Style/StringLiterals

get "/profil", to: "pages#profil", as: 'profil'
delete "/destroy_user_walk", to: "pages#destroy_user_walk"
 
  end
