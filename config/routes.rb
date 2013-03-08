TicketTracker2::Application.routes.draw do
  resources :concerts, :sports
  
  root :to => 'welcome#index'

end
