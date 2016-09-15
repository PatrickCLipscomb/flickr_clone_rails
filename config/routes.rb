Rails.application.routes.draw do
  root :to => 'images#index'
  devise_for :users
  resources :images do
    post 'favorite', on: :member
  end
  resources :users, only: :show do
    resources :images, except: [:show, :index, :edit, :create, :update, :destroy, :new] do
      post 'tag', on: :member
    end
  end
end
