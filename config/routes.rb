Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :users, only: [:show, :edit, :update]

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    # resourceだと、idなしでパスが生成される(urlで指定した「いいねのid」をcontrollerで受け取る必要がないから)
    resource :favorites, only: [:create, :destroy]
  end

end