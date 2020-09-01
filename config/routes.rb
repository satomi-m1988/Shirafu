Rails.application.routes.draw do
  # get 'favorites/create'
  # get 'favorites/destroy'
  # get 'relationships/create'
  # get 'relationships/destroy'
  # get 'comments/create'
  # get 'comments/destroy'
  # get 'homes/top'
  root 'homes#top'
  get 'tweets/hashtag' => 'tweets#hashtag'
  # get 'users/index' resourcesで記述している為コメントアウト
  # get 'users/show' resourcesで記述している為コメントアウト
  # get 'users/edit' resourcesで記述している為コメントアウト
  # get 'users/update' resourcesで記述している為コメントアウト
  # get 'users/confirm' resourcesで記述している為コメントアウト
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :follwers, on: :member
  end
end
