Rails.application.routes.draw do
  get 'zipping_folders/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :zipping_folders, only: [:create]
  root 'zipping_folders#new'
end
