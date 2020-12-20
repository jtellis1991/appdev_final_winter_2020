Rails.application.routes.draw do
 
  #Routes for Static HTML pages
  root 'static_pages#home'
  get '/support',   to: 'static_pages#support'
  get '/about',     to: 'static_pages#about'
  get '/blog',      to: 'static_pages#blog'
  
  # Routes for the Student model
  
  devise_for :students
  devise_scope :student do
    get '/signup',    to: 'devise/registrations#new'
    get '/edit',      to: 'devise/registrations#edit'
    get '/login',     to: 'devise/sessions#new'
  end
    
  get 'students/new'
  resources :students
end
