Rails.application.routes.draw do
 
  #Routes for Static HTML pages
  root 'static_pages#home'
  get 'support',   to: 'static_pages#support'
  get 'about',     to: 'static_pages#about'
  get 'news',      to: 'static_pages#news'
  
  # Routes for the Student model
  devise_for :students, controllers: { registrations:      "registrations", 
                                       sessions:           "sessions",
                                       confirmations:      "confirmations",
                                       passwords:          "passwords",
                                      # unlocks:            "unlocks",
                                     }
  
  devise_scope :student do 
    get       'signup',             to: 'devise/registrations#new',   as: :signup
    get       'settings',           to: 'devise/registrations#edit',  as: :settings
    get       'login',              to: 'devise/sessions#new',        as: :login
    post      'login',              to: 'devise/sessions#create'     
    delete    'logout',             to: 'devise/sessions#destroy',    as: :logout
    get       'unlock_account',     to: 'unlocked#new',               as: :unlocked
    post      'unlock_account',     to: 'unlocked#create'
    get       'students/unlocked',  to: 'unlocked#show',              as: :unlocking
    get       'password_reset',     to: 'devise/passwords#new',       as: :reset
    get       'confirm',            to: 'devise/confirmations#new',   as: :confirm
  end
    
  resources :students
    get 'dashboard',      to: 'students#show'
    get 'preferences',    to: 'students#edit'
end
