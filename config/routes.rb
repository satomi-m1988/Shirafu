Rails.application.routes.draw do
  root 'tweets#index'
  # get 'users/index' resourcesで記述している為コメントアウト
  # get 'users/show' resourcesで記述している為コメントアウト
  # get 'users/edit' resourcesで記述している為コメントアウト
  # get 'users/update' resourcesで記述している為コメントアウト
  # get 'users/confirm' resourcesで記述している為コメントアウト
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets
  resources :users
end
