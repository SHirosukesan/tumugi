Rails.application.routes.draw do
  namespace :admin do
    get 'admins/index'
  end
  get 'matchings/index'
  get 'notifications/index'
  get 'chats/index'
  get 'my_publishers/index'
  get 'publishers/index'
  get 'skills/index'
  get 'groups/index'
  get 'hobies/index'
  get 'works/index'
  get 'work/index'
  get 'my_pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
