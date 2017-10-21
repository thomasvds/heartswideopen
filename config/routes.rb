Rails.application.routes.draw do
  root to: 'volunteers#new'

  resources :volunteers
end
