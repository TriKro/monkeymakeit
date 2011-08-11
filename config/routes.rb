Suggestedit::Application.routes.draw do

  root :to => 'landing_pages#home'

  match "/tw" => 'redirects#show'
  match "/tw/*path" => 'redirects#show'

  # Omniauth routes
  match "/auth/:provider/callback" => "sessions#create"

  #Session routes
  match "/login/:provider" => "sessions#new"
  match "/signout" => "sessions#destroy", :as => :signout

  match "/activities/create", :to => "activities#create"
  resources :activities
  resources :funnels
  resources :steps

  resources :users
  resources :authentications, :only => [:index, :destroy]
  resources :invitations, :only => [:new, :create]
  resources :signups, :only => [:new, :create]
  resources :registrations, :only => [:new, :create] do
    post :invite_email, :on => :collection
  end
  match "/thanks_for_registering" => "registrations#registration_thanks", :as => :registration_thanks
  match "/i/:invite_code" => "registrations#new", :as => :invite

  match "/demo" => "landing_pages#demo"
  
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

  # Crout page routes
  [
          :doris,
          :hiccup,
          :life_of_the_gallows,
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
  match '/admin/scott' => 'admin#scott'
  match '/select_experiment' => 'admin#select_experiment', :as => :select_experiment
  match '/set_experiment' => 'admin#set_experiment', :as => :set_experiment

end
