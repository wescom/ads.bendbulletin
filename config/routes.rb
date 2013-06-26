AdUpload::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  
  resources :global_settings
  resources :upload_types
  resources :jobs
  resources :job_files
end