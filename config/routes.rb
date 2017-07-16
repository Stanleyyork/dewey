Dewey::Application.routes.draw do
  get '/' => 'application#homepage'
  namespace :api do
    get '/alexa/:book_title' => 'alexa#show'
  end
end
