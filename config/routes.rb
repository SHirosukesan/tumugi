Rails.application.routes.draw do
  # ーーーーーーーーーーーーーーーdeviceたちーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
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
  put "/users/:id/hide" => "users#hide", as: 'users_hide'
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
  get 'users/follow_index'
  # ーーーーーーーーーーーーーーーーーーーーーーーーーuserのformの
# userのroutes
  get 'publishers/edit_email'
  get 'publishers/edit_address'
  get 'publishers/edit_company_name'
  get 'publishers/edit_postalcode'
  get 'publishers/edit_number'
  get 'publishers/edit_profile'
# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーpublisherのformの
  get 'publishers/top'
  get 'matchings/index'
  get 'publishers/index'
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーuserのフォロー機能
  get 'match' => 'users_publishers#match', as: 'match' # フォローする
  get 'unmatch' => 'users_publishers#unmatch', as: 'unmatch' # フォロー外す
# ---------------マッチング機能------------------------------------------------------------------
  get 'publisher_match' => 'users_publishers#publisher_match', as: 'publisher_match' # フォローする
  get 'publisher_unmatch' => 'users_publishers#publisher_unmatch', as: 'publisher_unmatch' # フォロー外す
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーresourcesたち
  resources :users, expect:[:new] do
      resource :users_publishers,only:[:update]
  end
  resources :publishers, expect:[:new,:index] do
      resource :users_publishers,only:[:create,:destroy]
  end
end