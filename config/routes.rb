Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'users#home'
  get 'users/edit_nickname'
  get 'users/edit_age'
  get 'users/edit_number'
  get 'users/edit_firstname_lastname'
  get 'users/edit_postalcode'
  get 'users/edit_number'
  get 'users/edit_address'
  get 'users/edit_profile'
  get 'users/edit_prefecture'

  resources :users, expect:[:new]
  resources :app_users, only: [:create]
  resources :publishers, expect:[:new]
  get 'publishers/home'
  get 'assessments/index'
  get 'matchings/index'
  get 'notifications/index'
  get 'chats/index'
  get 'publishers/index'
  get 'skills/index'
  get 'groups/index'
  get 'hobies/index'
  get 'works/index'
  get 'work/index'
  get 'user/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
