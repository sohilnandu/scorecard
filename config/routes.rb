RailsBootstrap::Application.routes.draw do
  resources :scorecards

  root :to => 'visitors#new'
end
