Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :matches do
    resources :attendances, only: [:create]
  end
  resources :attendances , only: [:index, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users , only: :show
end
