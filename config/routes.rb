SwaggerRails::Application.routes.draw do

  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure' => 'sessions#failure', :as => :auth_failure
  match '/auth/facebook', :as => :facebook_login

  devise_scope :user do
    get "/logout" => "devise/sessions#destroy", :as => :user_logout
  end

  devise_for :users

  root :to => 'admin/docs#index'

  namespace :admin do
    resources :docs
  end
end
