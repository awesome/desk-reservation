DeskReservation::Application.routes.draw do
  
  resources :event
  resources :calendar

  root to: 'calendar#index'

  end
