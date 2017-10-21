Rails.application.routes.draw do
  root to: 'volunteers#new'
  resources :volunteers
  resources :slots, only: [:index]
  post 'twilio/sms' => 'twilio#sms'
  get 'slots/request_availabilities' => 'slots#request_availabilities'
end
