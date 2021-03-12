Rails.application.routes.draw do
	root to: "home#index"
  resources :study_items, only: [ :new, :create, :delete, :update ]
end
