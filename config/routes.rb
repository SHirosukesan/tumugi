Rails.application.routes.draw do
  devise_for :publishers,:controllers => {
      :registrations => 'publishers/registrations',
      :sessions => 'publishers/sessions',
      :passwords => 'publishers/passwords'
    }
  devise_for :users,:controllers => {
      :registrations => 'users/registrations',
      :sessions => 'users/sessions',
      :passwords => 'users/passwords'
    }
    # ※上記の記入でコントローラーを分ける,書いたほうがいいdavaiceinstall時にも別のコントローラーができる。そのコントローラーは特に何もいじらないとき使う。コントローラーの作成の必要がない。
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'users#home'
  get 'users/top'
  get 'users/edit_nickname'
  get 'users/edit_age'
  get 'users/edit_number'
  get 'users/edit_firstname_lastname'
  get 'users/edit_postalcode'
  get 'users/edit_number'
  get 'users/edit_address'
  get 'users/edit_profile'
  get 'users/edit_prefecture'
# userのroutes
  get 'publishers/top'
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
  resources :users, expect:[:new]
  resources :app_users, only: [:create]
  resources :publishers, expect:[:new,:index]
  resource :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
