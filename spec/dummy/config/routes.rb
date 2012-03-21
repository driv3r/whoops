Rails.application.routes.draw do
  mount Whoops::Engine => "/whoops"
end
