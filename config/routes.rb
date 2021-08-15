Rails.application.routes.draw do
  namespace :api do
    resources :companies, only: [:index, :show, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
