Rails.application.routes.draw do
 
  # Routes for the questions model 
  resources :questions
  # GET	        /questions	          questions#index	    display a list of all questions
  # GET	        /questions/new	      questions#new	      return an HTML form for creating a new question
  # POST	      /questions	          questions#create	  create a new question
  # GET	        /questions/:id	      questions#show	    display a specific question
  # GET	        /questions/:id/edit	  questions#edit	    return an HTML form for editing a question
  # PATCH/PUT	  /questions/:id	      questions#update  	update a specific question
  # DELETE	    /questions/:id	      questions#destroy 	delete a specific question
  
  #Paths:
  # questions_path           returns /questions
  # new_question_path        returns /questions/new
  # edit_question_path(:id)  returns /questions/:id/edit (for instance, edit_question_path(10) returns /questions/10/edit)
  # question_path(:id)       returns /questions/:id (for instance, question_path(10) returns /questions/10)
  
  resources :assessments
  resources :responses
  
  
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
    get("/dashboard", { :controller => "students", :action => "show"})
    get 'preferences',    to: 'students#edit'
    
    get("/tests/baseline", { :controller => "tests", :action => "show"})
    
  
end
