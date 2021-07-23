Rails.application.routes.draw do
  resources :products, defaults: { format: :json } do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :related_products, only: [:create, :destroy]
  end
end
