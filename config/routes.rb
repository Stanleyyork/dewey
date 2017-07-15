Dewey::Application.routes.draw do
  namespace :api do
    get '/alexa/:book_title' => 'alexa#show'
  end
end
