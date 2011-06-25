Suggestedit::Application.routes.draw do

  root :to => 'static#home'

  resources :activities
  resources :suggestions, :only => [:new, :update]
  match "/thanks_for_your_tweak" => "suggestions#thanks", :as => :suggestion_thanks

  resources :invitations, :only => [:new, :create]
  resources :signups, :only => [:new, :create]

  # Contact message routes
  resources :contact_messages
  match "/contact" => "contact_messages#new", :as => :contact
  match "/thanks_for_your_message" => "contact_messages#thanks", :as => :contact_thanks

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

  # Javascript
  get "/scripts/collaborate" => "scripts#collaborate", :as => 'collaborate_js'

  # Team members, bookmark the admin page. Visit it first to be excluded from
  # logging.
  match '/admin' => 'static#admin'
end
