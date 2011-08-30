Suggestedit::Application.routes.draw do
  root :to => 'root#index'

  # Omniauth routes
  match "/auth/:provider/callback" => "sessions#create"

  #Session routes
  match "/signin" => "sessions#new", :as => :signin
  match "/signout" => "sessions#destroy", :as => :signout
  match "/auth/failure" => "sessions#failure", :as => :auth_failure

  resources :users
  resources :authentications, :only => [:index, :destroy]
  resources :stories
  match '/hiccup' => 'stories#show', :id => 'oh-mighty-hiccup'

  resources :invites, :path => :thanks do
    # TODO: Hate the name of this route. Just call it send? Creates bug when I do it.
    post :send_invites, :on => :collection
  end

  resources :subscriptions, :only => :create

  match "/i/:referral_code" => "stories#referral_redirect", :as => :referral_redirect
  
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

  # Contact message routes
  resources :contact_messages, :only => [:new, :create]
  match "/contact" => "contact_messages#new", :as => :contact
  match "/thanks_for_your_message" => "contact_messages#thanks", :as => :contact_thanks

  # Team members, bookmark the admin page. Visit it first to be excluded from
  # logging.
  match '/admin' => 'admin#index'
  match '/set_experiment' => 'admin#set_experiment', :as => :set_experiment

end
