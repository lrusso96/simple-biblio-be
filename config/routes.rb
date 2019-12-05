# frozen_string_literal: true

Rails.application.routes.draw do
  post 'signup', to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'
  get 'downloads', to: 'users#downloads'

  post 'ebooks/download', to: 'ebooks#download'
  post 'ebooks/rate', to: 'ebooks#rate'
end
