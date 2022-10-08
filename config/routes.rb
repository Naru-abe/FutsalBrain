Rails.application.routes.draw do
  devise_for :users,skip: [:passwords]
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'

  resources :videos

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
