Timesheet::Application.routes.draw do
  root :to => 'home#index'

  get "admin"   => "admin/users#index", :as => "admin"
  get "log_in"  => "sessions#new",      :as => "log_in"
  get "log_out" => "sessions#destroy",  :as => "log_out"
  post "sessions/create", :as => "create_session"

  resources :google_app_auths
  namespace :admin do
    resources :users
  end

  match 'registration/new_password/:security_token' => 'registration#new_password',     :as => :new_password
  match 'registration/create_password/:id'          => 'registration#create_password',  :as => :create_password

  match 'auth/:provider/callback' => 'google_app_auths#create'
  get 'auth/google_apps', :as => 'google_auth'
  get 'auth/failure' => 'google_app_auths#failure'
end
