Rails.application.routes.draw do
  resources :file_uploads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'file_uploads#new'
end
