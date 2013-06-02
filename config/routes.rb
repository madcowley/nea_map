NeaMap::Application.routes.draw do
  resources :grantees
  resources :venues
  root :to => 'home#index'

end
