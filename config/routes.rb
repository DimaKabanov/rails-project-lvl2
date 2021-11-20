# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/ do
    root 'posts#index'
    resources :posts, only: %i[index new create show]
    devise_for :users
  end
end
