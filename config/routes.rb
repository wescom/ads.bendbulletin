AdUpload::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  
  resources :global_settings
  resources :email_texts
  
  resources :upload_types do
    get :detailed_instructions
  end
  
  resources :jobs
  get 'myjobs', :to => "jobs#myjobs"

  resources :job_files do
    post :approve
    post :reject
    get :download
  end
end