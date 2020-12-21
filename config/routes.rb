Rails.application.routes.draw do
 
  #Routes for Static HTML pages
  root 'static_pages#home'
  get 'support',   to: 'static_pages#support'
  get 'about',     to: 'static_pages#about'
  get 'news',      to: 'static_pages#news'
  
  # Routes for the Student model
  devise_for :students, controllers: { registrations: "registrations", 
                                       sessions: "sessions"}
  devise_scope :student do 
    get       'signup',     to: 'devise/registrations#new'
    get       'login',      to: 'devise/sessions#new'
    post      'login',      to: 'devise/sessions#create'
    delete    'logout',     to: 'devise/sessions#destroy'
    get       'settings',    to: 'devise/registrations#edit'
  end
    
  resources :students
    get 'dashboard',   to: 'students#show'
    get 'preferences',    to: 'students#edit'
end
