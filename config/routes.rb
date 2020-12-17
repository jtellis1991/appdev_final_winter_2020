Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/support'
    root 'application#hello'
end
