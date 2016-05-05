Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'events#index'

  get 'pages/home'
  resources :events do
    get 'latest', on: :collection
    post 'book', on: :member
    delete 'cancel_booking', on: :member
  end

  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
