Rails.application.routes.draw do
  get 'likes/new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  # resources :users, only: [:new, :create, :show]
  resources :feeds do
    collection do
      post :confirm
    end
  end
  # 多対多アソシエーション
  resources :likes, only:[:create, :destroy]
end
