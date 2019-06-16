Rails.application.routes.draw do
  root to: "users#new"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    collection do
      post :like
    end
  end
  # resources :users, only: [:new, :create, :show]
  resources :feeds do
    collection do
      post :confirm
    end
  end
  # 多対多アソシエーション
  resources :likes, only:[:new, :create, :destroy]

  # ローカル環境でのメール送信確認Gem letter_opener
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
