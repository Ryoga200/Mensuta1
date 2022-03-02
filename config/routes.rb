Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users
  get "/" => "posts#top"
  get "/about" => "posts#about"
  get 'search' => 'posts#search'
end
