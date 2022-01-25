Rails.application.routes.draw do

  get '/' => 'home#top'
  get 'about' => 'home#about'
  get 'login' => 'users#login_form'
  post "login" => "users#login"
  post "logout" => "users#logout"
  get 'signup' => 'users#new'

  post 'users/create' => 'users#create'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'
  
  get "posts/select" => "posts#select"
  get "posts/post" => "posts#post"
  get "posts/memory" => "posts#memory"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  post "posts/:id/destroy" => "posts#destroy"

end

