Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'boards', to: 'boards#index'
  # get 'boards/new', to: 'boards#new'
  # post 'boards', to: 'boards#create'
  # get 'boards/:id', to: 'boards#show' 
  # resources :boards, only: [:index, :new, :create, :show, :edit, :update] # 基本的なルーティングを追加できる　複数形で書く 限定できる

  root 'home#index'
  resources :boards # 全適用
  resources :comments, only: %i[create destroy]
end
