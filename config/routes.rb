DeskReservation::Application.routes.draw do
  
  get "event/index"
  get "event/new"
  get "event/create"
  get "event/edit"
  get "event/show"
  get "event/update"
  resources :calendar

  root to: 'calendar#index'

  end
