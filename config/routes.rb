Whoops::Engine.routes.draw do
  resources :event_groups do
    resources :events
  end

  resources :events

  root :to => "event_groups#index"
end
