Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: '/log_in', registration: '/home', password: '/forgot_password'}
  root to: "site#home"
  resources :site, only: [:home, :log_in]
  get '/home' => 'site#home'
  get '/log_in' => 'site#log_in'
  get '/log_in' => 'site#forgot_password'
end
