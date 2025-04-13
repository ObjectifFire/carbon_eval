Rails.application.routes.draw do
  resources :companies, only: [:show] do
    member do
      get :pdf
    end
  end
end