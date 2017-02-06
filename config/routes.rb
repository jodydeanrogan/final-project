Rails.application.routes.draw do
  mount ImageUploader::UploadEndpoint => "/images/upload"
  devise_for :users, path: '', path_names: { sign_in: '/log_in', registration: '/home', password: '/forgot_password' }, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "site#home"
  resources :site, only: [:home, :log_in]
  resources :activities
  get '/get_image_tags' => 'clarifais#get_image_tags'
  get '/home' => 'site#home'
  get '/log_in' => 'site#log_in'
  get '/log_in' => 'site#forgot_password'
end
