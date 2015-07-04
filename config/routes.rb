GrapeOnRails::Application.routes.draw do
  devise_for :users
  get 'welcome/index'
  mount API => '/'
  root 'welcome#index'
end
