Suggestedit::Application.routes.draw do

  root :to => 'landing_pages#home'

  # Omniauth routes
  match "/auth/:provider/callback" => "sessions#create"

  #Session routes
  match "/signout" => "sessions#destroy", :as => :signout
  match "/auth/failure" => "sessions#failure", :as => :auth_failure

  resources :users
  resources :authentications, :only => [:index, :destroy]

  resources :registrations, :only => [:new, :create] do
    post :invite_email, :on => :collection
  end
  match "/thanks_for_registering" => "registrations#registration_thanks", :as => :registration_thanks
  match "/i/:invite_code" => "registrations#new", :as => :invite
  
  # Static page routes
  [
          :code,
          :privacy_policy,
          :terms_of_service,
          :about,
          :cookie
  ].each do |static_page|
    match "/#{static_page}" => "static##{static_page}", :as => static_page
  end

  # Story page routes
  [
          :doris,
          :hiccup,
          :life_of_the_gallows,
  ].each do |story_page|
    match "/#{story_page}" => "stories##{story_page}", :as => story_page
  end

  # Contact message routes
  resources :contact_messages, :only => [:new, :create]
  match "/contact" => "contact_messages#new", :as => :contact
  match "/thanks_for_your_message" => "contact_messages#thanks", :as => :contact_thanks

  # Team members, bookmark the admin page. Visit it first to be excluded from
  # logging.
  match '/admin' => 'admin#index'
  match '/set_experiment' => 'admin#set_experiment', :as => :set_experiment

end