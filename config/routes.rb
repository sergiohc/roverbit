# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: :create

  post 'sample', controller: :home, action: :sample
end
