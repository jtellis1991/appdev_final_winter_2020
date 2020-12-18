Rails.application.routes.draw do
  get 'students/new'
  root 'static_pages#home'
  get '/support',   to: 'static_pages#support'
  get '/about',     to: 'static_pages#about'
  get '/blog',      to: 'static_pages#blog'
  get '/signup',    to: 'students#new'
  
  
end
