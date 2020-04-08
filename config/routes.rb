Rails.application.routes.draw do
  devise_for :volunteers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :plannings, except: [:show, :edit, :update]
end
