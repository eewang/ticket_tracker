TicketTracker2::Application.routes.draw do

  get 'concerts/get_festivals/' => 'concerts#get_festivals'
  get 'sports/get_probasketball/' => 'sports#get_probasketball'

  root :to => 'site#index'
  resources :concerts, :sports

end
