Suggestedit::Application.routes.draw do

  root :to => 'landing_pages#home'

  # Omniauth routes
  match "/auth/:provider/callback" => "sessions#create"

  #Session routes
  match "/login/:provider" => "sessions#new"
  match "/signout" => "sessions#destroy", :as => :signout

  resources :activities

  resources :invitations, :only => [:new, :create]
  resources :signups, :only => [:new, :create]
  resources :registrations, :only => [:create]
  match "/thanks_for_registering" => "registrations#thanks", :as => :registration_thanks

  # Static page routes
  [
          :demo,
          :code,
          :privacy_policy,
          :terms_of_service,
          :about
  ].each do |static_page|
    match "/#{static_page}" => "static##{static_page}", :as => static_page
  end

  # Crout page routes
  [
          :doris_1,
          :heart_1,
          :hiccup_1,
          :life_of_the_gallows_1,
          :doris_2,
          :heart_2,
          :hiccup_2,
          :life_of_the_gallows_2,
          :doris_3,
          :heart_3,
          :hiccup_3,
          :life_of_the_gallows_3,
          :doris_4,
          :heart_4,
          :hiccup_4,
          :life_of_the_gallows_4,
          :doris_5,
          :heart_5,
          :hiccup_5,
          :life_of_the_gallows_5,
  ].each do |crout_page|
    match "/#{crout_page}" => "crouts##{crout_page}", :as => crout_page
  end

  # Contact message routes
  resources :contact_messages, :only => [:new, :create]
  match "/contact" => "contact_messages#new", :as => :contact
  match "/thanks_for_your_message" => "contact_messages#thanks", :as => :contact_thanks

  # Javascript
  get "/scripts/collaborate" => "scripts#collaborate", :as => 'collaborate_js'

  # Team members, bookmark the admin page. Visit it first to be excluded from
  # logging.
  match '/admin' => 'admin#index'

end
