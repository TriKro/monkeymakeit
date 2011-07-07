Suggestedit::Application.routes.draw do

  root :to => 'landing_pages#home'

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
          :hiccup,
          :hiccup2,
          :doris,
          :doris2
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
