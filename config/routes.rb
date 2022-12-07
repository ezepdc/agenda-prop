Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :contacts
  resources :properties
  resources :contracts do
    resources :contract_prices
  end
  resources :incidents do
    resources :incident_updates
  end
end
