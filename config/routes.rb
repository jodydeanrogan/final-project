Rails.application.routes.draw do
  devise_for :users
  root to: "site#home"
  get '/home' => 'site#home'
end
