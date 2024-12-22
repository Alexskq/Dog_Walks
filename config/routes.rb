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
  end
