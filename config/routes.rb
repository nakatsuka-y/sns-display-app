Rails.application.routes.draw do
  get 'app/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  get '/twitter_authorize', to: 'application#twitter_authorize'
  get '/twitter_reload', to: 'application#twitter_reload'
  get '/twitter_like', to: 'application#twitter_like'
end
