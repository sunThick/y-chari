Rails.application.routes.draw do

  #device

  devise_for :users, controllers: {
    # ↓ローカルに追加されたコントローラーを参照する(コントローラー名: "コントローラーの参照先")
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
  # サインアウトのエラーを解消
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  
  root "posts#index" 
  get "categories/:category", to: "posts#index"

  post "posts/upload_image", to: "posts#upload_image"
  post "accounts/upload_image", to: "accounts#upload_image"
  post "accounts/delete_image", to: "accounts#delete_image"
  post "accounts/delete_image", to: "accounts#delete_image"

  resources :posts do  #postsコントローラへのルーティング  
    resource :likes, only: [:create, :destroy]
  end

  get '/:username' => 'users#show', as: :users_show
  get '/:username/likes' => 'users#likes'


  resource :account

end