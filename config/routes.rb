Rails.application.routes.draw do
  devise_for :users
  resources :coops do
	resources :reviews
  end
  root 'coops#index'
end
