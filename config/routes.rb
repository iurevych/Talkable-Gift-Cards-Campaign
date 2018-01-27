Rails.application.routes.draw do
  get '/redeem' => 'invite#show'
  get '/purchase' => 'invite#purchase'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
