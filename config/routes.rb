Monkeymakeit::Application.routes.draw do
  root :to => 'root#index'

  # Session and Omniauth routes
  match "/auth/:provider/callback" => "sessions#create"
  match "/signin" => "sessions#new", :as => :signin
  match "/signout" => "sessions#destroy", :as => :signout
  match "/auth/failure" => "sessions#failure", :as => :auth_failure
  match "/create_session" => "sessions#create"

  resources :users do
    put :update_email, :on => :member
  end
  match '/please_add_your_email' => 'users#add_email', :as => :add_email
  resources :authentications, :only => [:index, :destroy]

  resources :stories do
    resources :chapters, :path => "chapter"
  end
  match '/hiccup' => 'stories#show', :id => 'oh-mighty-hiccup'

  resources :subscriptions, :only => :create

  resources :invites, :path => :thanks do
    post :send_invites, :on => :collection
  end
  match "/i/:referral_code" => "invites#referral_redirect", :as => :referral_redirect

  # Static page routes
  [
          :code,
          :privacy_policy,
          :terms_of_service,
          :about,
          :cookie # private; to exclude from logging
  ].each do |static_page|
    match "/#{static_page}" => "static##{static_page}", :as => static_page
  end

  # Contact message routes
  resources :contact_messages, :only => [:new, :create]
  match "/contact" => "contact_messages#new", :as => :contact
  match "/thanks_for_your_message" => "contact_messages#thanks", :as => :contact_thanks

  # Private
  match '/admin' => 'admin#index'
  match '/set_experiment' => 'admin#set_experiment', :as => :set_experiment

end
