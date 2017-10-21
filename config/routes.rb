Rails.application.routes.draw do
  root to: 'volunteers#new'
  resources :volunteers
  post 'twilio/sms' => 'twilio#sms'
end
