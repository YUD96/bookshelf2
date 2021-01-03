# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'
get '/books', to: 'books#index'
get '/books/new', to: 'books#new'
post '/books', to: 'books#create'
delete '/books/:id', to: 'books#destroy'

get '/users', to: 'users#index'
get '/users/new', to: 'users#new'
get '/users/:id', to: 'users#show'
post '/users', to: 'users#create'

