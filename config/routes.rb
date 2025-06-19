# frozen_string_literal: true

Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  get 'sessions/logout'
  get 'sessions/omniauth'
  get 'users/show'
  get 'welcome/index'

  resources :items, only: %i[index show edit update create new destroy] do
    member do
      patch :set_status
    end
  end
  resources :user_profiles
  resources :users do
    member do
      patch :update_auth_level
    end
  end

  root 'welcome#index'
  get 'welcome/index', to: 'welcome#index', as: 'welcome'

  get '/logout', to: 'sessions#logout', as: 'logout'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/add_note_to_item', to: 'items#add_note', as: 'add_note'

  post '/create_new_event', to: 'events#new', as: 'create_event'
  get '/publish_event', to: 'events#publish_event', as: 'publish_event'

  get 'export_items', to: 'items#export', as: 'export_items'
  get 'import_items', to: 'items#import', as: 'import_items'

  get 'admin/login', to: 'admin_sessions#new', as: 'admin_login'
  post 'admin/login', to: 'admin_sessions#create'
  delete 'admin/logout', to: 'admin_sessions#destroy', as: 'admin_logout'
  get 'admin/dashboard', to: 'admin_sessions#dashboard', as: 'admin_dashboard'
end
