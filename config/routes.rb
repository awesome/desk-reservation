DeskReservation::Application.routes.draw do
  
  resources :calendar
  root to: 'calendar#home'

  end
