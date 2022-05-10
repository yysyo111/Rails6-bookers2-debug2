Rails.application.routes.draw do
  # get 'relationships/followings'
  # get 'relationships/followers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  
  resources :users, only: [:index,:show,:edit,:update] do 
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# いいね機能の場合は「1人のユーザーは1つの投稿に対して1回しかいいねできない」という仕様
# resourceは「それ自身のidが分からなくても、関連する他のモデルのidから特定できる」
