Rails.application.routes.draw do
  resources :companies, only: [:index] do
    collection do
      get :pdf
    end
  end
end
