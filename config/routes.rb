Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '' => 'homes#top'
  get '/home/about' => 'homes#about'
  post '/books/:id' => 'books#create'
  resources :books
  resources :users
end
