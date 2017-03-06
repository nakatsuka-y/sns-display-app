Rails.application.routes.draw do
  get 'app/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  get '/authorize', to: 'application#authorize'
end
