Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  resources :enquiries

  get '/enquiries/:id/response', to: 'responses#new', :as => "new_response"
  post '/responses', to: 'responses#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
