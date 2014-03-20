Battleship::Application.routes.draw do
  root :to => 'games#new'
  resource :games, :only => [:create, :result]
  get '/result/', :to => 'games#result'
end
