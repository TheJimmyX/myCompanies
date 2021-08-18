Rails.application.routes.draw do  
  namespace :api do
    resources :companies, only: [:index, :show, :create, :update, :destroy]
    resources :employes,  only: [:index, :show, :create, :update, :destroy]
    
    get '/companies/:id/employes',  to: 'companies#employes'
  end
  root 'companies#index'
end
