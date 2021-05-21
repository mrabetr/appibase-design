Rails.application.routes.draw do
  # devise_for :accounts,
  # # path: 'auth', # to have /auth/signup instead of /accounts/signup
  # path_names: {
  #   sign_in: 'login',
  #   sign_out: 'logout',
  #   password: 'password',
  #   registration: 'signup'
  # },
  # controllers: {
  #   sessions: 'sessions',
  #   password: 'password',
  #   registrations: 'registrations'
  # }

  devise_for :accounts, skip: :all

  devise_scope :account do
    scope :auth, defaults: { format: :json } do
      post   '/login',       to: 'sessions#create'
      delete '/logout',      to: 'sessions#destroy'
      post   '/signup',       to: 'registrations#create'
      put    '/account',      to: 'registrations#update'
      delete '/account',      to: 'registrations#destroy'
      put    '/password',     to: 'devise/passwords#update'
      post   '/password',     to: 'devise/passwords#create'
      # get    '/confirmation', to: 'devise/confirmations#show'
      # post   '/unlock',       to: 'devise/unlocks#create'
      # get    '/unlock',       to: 'devise/unlocks#show'
    end
  end

  # https://thinkster.io/tutorials/rails-json-api/setting-up-users-and-authentication-for-our-api
  # scope :api, defaults: { format: :json } do
  #   devise_for :users
  # end
end
