Rails.application.routes.draw do
  # 管理者側のルーティング
  devise_for :admins, controllers: {
  # ログイン、ログアウト関連
    sessions:       'admins/sessions',
  # パスワード
    password:       'admins/passwords',
  # 会員登録
    registrations:  'admins/registrations'
  }
  namespace :admins do
    # トップ（注文履歴一覧）
    root to:"homes#top"
    # 商品関連
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    # ジャンルについて
    resources :genres, only: [:index, :create, :edit,  :update]
    # 顧客情報
    resources :customers, only: [:index, :show, :edit, :update]
    # 注文詳細画面
    resources :orders, only: [:show, :update]
    # 製作ステータス
    resources :order_details, only: [:update]
  end
  # 顧客側のルーティング
  devise_for :customers, controllers: {
    sessions:       'publics/sessions',
    password:       'publics/passwords',
    registrations:  'publics/registrations'
  }

  # URL変更不可、ファイル構成変更不可
  scope module: 'publics' do
    # トップページ
    root to:'homes#top'
    # アバウトページ
    get 'about' => 'homes#about'
    # 商品ページ
    resources :products, only: [:index, :show]
    # カート内商品について
    resources :cart_items, only: [:index, :update, :create, :destroy] do
      delete 'destroy_all', on: :collection
    end
    # 注文画面について
    get 'orders/confirm' => 'orders#confirm'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only:[:new, :index, :show, :update]
    # 配送先住所について
    resources :delivery_addresses, only:[:index, :edit, :create, :update, :destroy]
  end



  namespace :publics do
    # 顧客の会員登録関連
    resources :registrations, only: [:new, :create]

    # 顧客のページ関連
    get 'show' => 'customers#show', as: 'customers/mypage'
    get 'customers/edit' => 'customers#edit', as: 'customers/information/edit'
    patch 'update' => 'customers#update', as: 'customers/information'
    get 'check' => 'customers#check'
    patch 'customers/withdrawal' => 'customers#withdrawal', as: 'customers_withdrawal'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end